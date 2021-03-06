const $siteList = $('.siteList')
const $lastLi = $siteList.find('li.last')
const x = localStorage.getItem('x')
const xObject = JSON.parse(x)
const hashMap = xObject || [
	{ logo: 'A', url: 'https://www.acfun.cn' },
	{ logo: 'B', url: 'https://www.bilibili.com' },
	{ logo: 'G', URL: 'https://www.google.com' },
]
const simplifyUrl = (url) => {
	return url
		.replace('https://', '')
		.replace('http://', '')
		.replace('www.', '')
		.replace(/\/.*/, '')
}

const render = () => {
	$siteList.find('li:not(.last)').remove()
	hashMap.forEach((node, index) => {
		const $li = $(`<li>
<div class="site">
<div class="logo">${node.logo}</div>
<div class = "link">${simplifyUrl(node.url)}</div>
<div class = "close">
<svg class = "icon">
<use x link:href="#icon-close"></use>
</svg>
</div>
</div>
</li>`).insertBefore($lastLi)
		$li.on('click', () => {
			window.open(node.url)
		})
		$li.on('click', '.close', (e) => {
			e.stopPropagation()
			hashMap.splice(index, 1)
			render()
		})
	})
}

render()

$('.addButton').on('click', () => {
	let url = window.prompt('请问你想添加什么网站呀？（๑ `▽´๑)')
	if (url.indexOf('http') !== 0) {
		url = 'https://' + url
	}
	console.log(url)
	hashMap.push({
		logo: simplifyUrl(url)[0].toUpperCase(),
		url: url,
	})
	render()
})
window.onbeforeunload = () => {
	const string = JSON.stringify(hashMap)
	localStorage.setItem('x', string)
}

$(document).on('keypress', (e) => {
	const { key } = e
	for (let i = 0; i < hashMap.length; i++) {
		if (hashMap[i].logo.toLowerCase() === key) {
			window.open(hashMap[i].url)
		}
	}
})

//以上是已经完成了的

//---------------------------------------------------------------------------------------//
// const hashMap = {} //parcel 会默认在我们的列表里加一个作用域,所以没办法查看全局变量
// window.hashMap = {}
// const $siteList = $('.siteList')
// const $lastLi = $siteList.find('li.last')
// const x = localStorage.getItem('x')
// const xObject = JSON.parse(x)
// const hashMap = xObject || [
// 	{ logo: 'A', logoType: 'text', url: 'https://www.acfun.cn' },
// 	{
// 		logo: 'B',
// 		logoType: 'text',
// 		url: 'https://www.bilibili.com',
// 	},
// ]

// const simplifyUrl = (url) => {
// 	return url
// 		.replace('https://', '')
// 		.replace('http://', '')
// 		.replace('www.', '')
// 		.replace(/\/.*/, '') //删除/开头的内容
// }

// const render = () => {
// 	$siteList.find('li:not(.last)').remove()
// 	hashMap.forEach((node, index) => {
// 		const $li = $(`<li>

//        <div class="site">
//          <div class="logo">${node.logo}</div>
//          <div class="link"> ${simplifyUrl(node.url)}</div>
//          <div class="close">
//            <svg class="icon">
//              <use xlink:href="#icon-close">
//              </use>
//            </svg>
//          </div>
//        </div>
//     </li>
//     `).insertBefore($lastLi)

// 		$li.on('click', () => {
// 			window.open(node.url)
// 		})
// 		$li.on('click', '.close', (e) => {
// 			console.log('这里')
// 			e.stopPropagation() //阻止冒泡
// 			hashMap.splice(index, 1)
// 			render()
// 			console.log(hashMap)
// 		})
// 	})
// }
// render()
// $('.addButton').on('click', () => {
// 	let url = window.prompt('请问你要添加什么网址？')
// 	if (url.indexOf('http') !== 0) {
// 		url = 'https://' + url
// 	}
// 	console.log(url)
// 	hashMap.push({
// 		logo: simplifyUrl(url)[0].toUppercase(),
// 		url: url,
// 	})
// 	render()
// })

// window.onbeforeunload = () => {
// 	const string = JSON.stringify(hashMap)
// 	localStorage.setItem('x', string)
// }

// $(document).on('keypress', (e) => {
// 	const { key } = e //如果变量名和属性名是一样的即const key =e.key就可以简写成const {key}=e
// 	for (let i = 0; i < hashMap.length; i++) {
// 		if (hashMap[i].logo.toLowerCase() === key) {
// 			window.open(hashMap[i].url)
// 		}
// 	}
// })
