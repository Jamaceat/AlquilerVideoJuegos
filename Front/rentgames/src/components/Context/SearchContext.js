import {useState} from "react"

export default function SearchContext() {
	const [tipo, setTipo] = useState("ReleaseDate")
	const [valorActual, setValorActual] = useState("")
	const [datos, setDatos] = useState([])

	// Agrega los datos que seran las filas de la tabla

	const addDatos = (data) => {
		setDatos(data)
	}

	// Valores posibles= 'title':String ,ReleaseDate:int , protagonist:string ,director:string
	const addTipo = (data) => {
		setTipo(data)
	}

	const addValorActual = (data) => {
		setValorActual(data)
	}
	//  Retorna el tipo que debe recibir en los inputs dependiendo del hook tipo

	return {tipo, valorActual, datos, addDatos, addTipo, addValorActual}
}
