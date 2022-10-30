import {useState} from "react"

export default function BestContext() {
	const [client, setClient] = useState({})
	const [title, setTitle] = useState({})

	const AddClient = (data) => {
		setClient(data)
	}

	const addTitle = (data) => {
		setTitle(data)
	}

	return {client, title, AddClient, addTitle}
}
