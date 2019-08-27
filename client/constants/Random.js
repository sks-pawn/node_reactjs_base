export function getRandomString() {
    return (Math.random().toString(36).substring(2, 2 + 7) + '0'.repeat(7)).substring(0, 7);
}