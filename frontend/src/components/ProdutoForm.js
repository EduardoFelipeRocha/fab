import React, {useState} from "react";
import api from '../services/api';
import { formToJSON } from "axios";

function ProdutoForm({onProdutoAdicionado}) {
  const [nome, setNome] = useState('');

  const handleSubmit = (e) =>{
     e.preventDefault();

     api.post('produtos/',{nome})
     .then(response =>{
        onProdutoAdicionado();
        setNome('');
     })
     .catch(error => console.error('Erro ao adicionar produtos:', error))
     
  };
return (
    <form onSubmit={handleSubmit}>
    <input 
    type="text"
    placeholder="Nome do Produto"
    value={nome}
    onChange={(e)=> setNome(e.target.value)}
    />
    <button type="submit">adicionar</button>
    </form>
)};
export default ProdutoForm