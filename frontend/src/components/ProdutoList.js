import React, {useState, useEffect} from "react";
import api from "../services/api";

function ProdutoList(){
    const[produtos, setProdutos] = useState([]);
    const[loading, setLoading] = useState(true);

    useEffect(()=>{
        api.get('produtos')
        .then(response => {
            setProdutos(response.data);
            setLoading(false);
        })
        .catch(error => {
            console.error("Erro ao buscar produtos:", error);
            setLoading(false);
        });
    }, []);
    if (loading) return <p>Carregando Produtos...</p>

    return(
        <ul>
            {produtos.map(prod=>(
            <li key={prod.id}>{prod.nome}</li>
            ))}
        </ul>
    );
}
export default ProdutoList;
