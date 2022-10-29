import {useState} from "react"

export const BillsContext = () => {
	const [bills, setBills] = useState([])

	const addBills = (data) => {
		const dataa = data
		setBills(dataa)
	}

	return {
		bills,
		addBills,
	}
}
