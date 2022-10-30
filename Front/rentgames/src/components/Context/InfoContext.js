import {useState} from "react"

export default function BestContext() {
	const [client, setClient] = useState({})
	const [title, setTitle] = useState({})
	const [menosRentados, setMenosRentados] = useState([])
	const [daily, setDaily] = useState([])

	const AddClient = (data) => {
		setClient(data)
	}

	const addMenosRentados = (data) => {
		setMenosRentados(data)
	}

	const addTitle = (data) => {
		setTitle(data)
	}

	const addDaily = (data) => {
		setDaily(data)
	}

	return {
		client,
		title,
		menosRentados,
		daily,
		addDaily,
		AddClient,
		addTitle,
		addMenosRentados,
	}
}
