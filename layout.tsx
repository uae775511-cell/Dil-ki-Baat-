import "./globals.css";
export const metadata = { title: "Dil Ki Baat ❤️", description: "Jahan dil ki baat, dil tak pahuche." };
export default function RootLayout({children}:{children:React.ReactNode}) {
  return <html lang="en"><body>{children}</body></html>;
}
