
#let wareki_today = {
  let y = datetime.today().year() - 2018
  let m = datetime.today().month()
  let d = datetime.today().day()
  if y == 1 [
    令和 元年 #m 月 #d 日
  ] else [令和 #y 年 #m 月 #d 日]
}

#let wareki(y, m: none, d: none) = {
  let twareki = [#y 年]
  if y > 2019 {
    let reiwa = y - 2018
    twareki = [令和 #reiwa 年]
    if m != none {
      twareki = [#twareki #m 月]
    }
  } else if y == 2019 {
    if m == none {
      twareki = [令和元年]
    } else if m < 5 {
      twareki = [平成31年 #m 月]
    } else {
      twareki = [令和元年 #m 月]
    }
  } else if y > 1988 {
    let heisei = y - 1988
    twareki = [平成 #heisei 年]
    if m != none {
      twareki = [#twareki #m 月]
    }
  } else if y == 1988 {
    if m == none {
      twareki = [平成元年]
    } else if d == none {
      twareki = [平成元年 #m 月]
    } else if m == 1 and d < 8 {
      twareki = [昭和64年 #m 月]
    } else {
      twareki = [平成元年 #m 月]
    }
  } else if y > 1926{
    let showa = y - 1925
    twareki = [昭和 #showa 年]
    if m != none {
      twareki = [#twareki #m 月]
    }
  } else if y == 1926 {
    if m == none {
      twareki = [昭和元年]
    } else if d == none {
      twareki = [大正15年 #m 月]
    } else if m == 12 and d > 24 {
      twareki = [昭和元年 #m 月]
    } else {
      twareki = [大正15年 #m 月]
    }
  } else {
    twareki = [#y 年 #m 月]
  }

  if m != none and d != none {
    [#twareki #d 日]
  } else [#twareki]
}
