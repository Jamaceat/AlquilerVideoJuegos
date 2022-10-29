import {useState} from "react"

export default function GameContext() {
	const [games, setGames] = useState([])
	const [enableChangePrice, setEnableChangePrice] = useState({
		enable: false,
		only: -1,
	})

	const addGames = (data) => {
		setGames(data)
	}

	const setSwitch = (idGame) => {
		console.log(enableChangePrice, "aaaa", idGame)
		setEnableChangePrice({enable: !enableChangePrice.enable, only: idGame})
	}

	return {games, addGames, enableChangePrice, setSwitch}
}
