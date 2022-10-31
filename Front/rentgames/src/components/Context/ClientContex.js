import {useState} from "react"

export default function ClientContext() {
	const [user, setUser] = useState({})
	const [datos, setDatos] = useState([])
	const [activo, setActivo] = useState(false)

	// Switchear el valor activo

	const addActivo = () => {
		setActivo(!activo)
	}

	// Asignar todos los datos de juegos rentados por el cliente
	const addUser = (data) => {
		setUser(data)
	}

	// Asignar todos los datos del usuario
	const addDatos = (data) => {
		setDatos(data)
	}

	return {user, datos, activo, addActivo, addUser, addDatos}
}
