import {useState} from "react"

export default function SearchContext() {
	const [tipo, setTipo] = useState("ReleaseDate")
	const [valorActual, setValorActual] = useState("")

	// Valores posibles= 'title':String ,ReleaseDate:int , protagonist:string ,director:string
	const addTipo = (data) => {
		setTipo(data)
	}

	const addValorActual = (data) => {
		setValorActual(data)
	}
	//  Retorna el tipo que debe recibir en los inputs dependiendo del hook tipo

	return {tipo, valorActual, addTipo, addValorActual}
}
