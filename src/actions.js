
const toggleGreeting = () => ({
    type: "ToggleGreeting"
})

const changeName = (string) => ({
    type: "ChangeName",
    payload: string
})

export {
    toggleGreeting,
    changeName
}