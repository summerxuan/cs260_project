function [new] = angles(old)
  new = zeros(1,22);
 
  mid1 = [(old(71)+old(63))/2, (old(72)+old(64))/2]; 
  new(1) = acosd(dot([old(59)-mid1(1), old(60)-mid1(2)], [old(67)-mid1(1), old(68)-mid1(2)])/(norm([old(59)-mid1(1), old(60)-mid1(2)])*norm([old(67)-mid1(1), old(68)-mid1(2)])));
  
  mid2 = [(old(163)+old(155))/2, (old(164)+old(156))/2]; 
  new(2) = acosd(dot([old(151)-mid2(1), old(152)-mid2(2)], [old(159)-mid2(1), old(160)-mid2(2)])/(norm([old(151)-mid2(1), old(152)-mid2(2)])*norm([old(159)-mid2(1), old(160)-mid2(2)])));
  
  new(3) = acosd(dot([old(125)-old(129), old(126)-old(130)], [old(127)-old(129), old(128)-old(130)])/(norm([old(125)-old(129), old(126)-old(130)])*norm([old(127)-old(129), old(128)-old(130)])));
  
  new(4) = acosd(dot([old(111)-old(129), old(112)-old(130)], [old(119)-old(129), old(120)-old(130)])/(norm([old(111)-old(129), old(112)-old(130)])*norm([old(119)-old(129), old(120)-old(130)])));
  
  new(5) = acosd(dot([old(113)-old(125), old(114)-old(126)], [old(115)-old(125), old(116)-old(126)])/(norm([old(113)-old(125), old(114)-old(126)])*norm([old(115)-old(125), old(116)-old(126)])));
  
  new(6) = acosd(dot([old(121)-old(127), old(122)-old(128)], [old(123)-old(127), old(124)-old(128)])/(norm([old(121)-old(127), old(122)-old(128)])*norm([old(123)-old(127), old(124)-old(128)])));
  
  mid3 = [(old(109)+old(95))/2, (old(110)+old(96))/2]; 
  new(7) = acosd(dot([old(75)-mid3(1), old(76)-mid3(2)], [old(93)-mid3(1), old(94)-mid3(2)])/(norm([old(75)-mid3(1), old(76)-mid3(2)])*norm([old(93)-mid3(1), old(94)-mid3(2)])));
  
  mid4 = [(old(77)+old(91))/2, (old(78)+old(92))/2]; 
  new(8) = acosd(dot([old(75)-mid4(1), old(76)-mid4(2)], [old(93)-mid4(1), old(94)-mid4(2)])/(norm([old(75)-mid4(1), old(76)-mid4(2)])*norm([old(93)-mid4(1), old(94)-mid4(2)])));
  
  new(9) = acosd(dot([old(53)-old(51), old(54)-old(52)], [old(39)-old(51), old(40)-old(52)])/(norm([old(53)-old(51), old(54)-old(52)])*norm([old(39)-old(51), old(40)-old(52)])));
  
  new(10) = acosd(dot([old(43)-old(53), old(44)-old(54)], [old(51)-old(53), old(52)-old(54)])/(norm([old(43)-old(53), old(44)-old(54)])*norm([old(51)-old(53), old(52)-old(54)])));
  
  new(11) = acosd(dot([old(43)-old(39), old(44)-old(40)], [old(51)-old(39), old(52)-old(40)])/(norm([old(43)-old(39), old(44)-old(40)])*norm([old(51)-old(39), old(52)-old(40)])));
  
  new(12) = acosd(dot([old(53)-old(43), old(54)-old(44)], [old(39)-old(43), old(40)-old(44)])/(norm([old(53)-old(43), old(54)-old(44)])*norm([old(39)-old(43), old(40)-old(44)])));
  
  new(13) = acosd(dot([old(145)-old(135), old(146)-old(136)], [old(131)-old(135), old(132)-old(136)])/(norm([old(145)-old(135), old(146)-old(136)])*norm([old(131)-old(135), old(132)-old(136)])));
  
  new(14) = acosd(dot([old(135)-old(145), old(136)-old(146)], [old(143)-old(145), old(144)-old(146)])/(norm([old(135)-old(145), old(136)-old(146)])*norm([old(143)-old(145), old(144)-old(146)])));
  
  new(15) = acosd(dot([old(135)-old(131), old(136)-old(132)], [old(143)-old(131), old(144)-old(132)])/(norm([old(135)-old(131), old(136)-old(132)])*norm([old(143)-old(131), old(144)-old(132)])));
  
  new(16) = acosd(dot([old(145)-old(143), old(146)-old(144)], [old(131)-old(143), old(132)-old(144)])/(norm([old(145)-old(143), old(146)-old(144)])*norm([old(131)-old(143), old(132)-old(144)])));
  
  new(17) = acosd(dot([old(3)-old(11), old(4)-old(12)], [old(19)-old(11), old(20)-old(12)])/(norm([old(3)-old(11), old(4)-old(12)])*norm([old(19)-old(11), old(20)-old(12)])));
  
  new(18) = acosd(dot([old(21)-old(29), old(22)-old(30)], [old(37)-old(29), old(38)-old(30)])/(norm([old(21)-old(29), old(22)-old(30)])*norm([old(37)-old(29), old(38)-old(30)])));
  
  new(19) = acosd(dot([mid3(1)-old(75), mid3(2)-old(76)], [mid4(1)-old(75), mid4(2)-old(76)])/(norm([mid3(1)-old(75), mid3(2)-old(76)])*norm([mid4(1)-old(75), mid4(2)-old(76)])));
  
  new(20) = acosd(dot([mid3(1)-old(93), mid3(2)-old(94)], [mid4(1)-old(93), mid4(2)-old(94)])/(norm([mid3(1)-old(93), mid3(2)-old(94)])*norm([mid4(1)-old(93), mid4(2)-old(94)])));
  
  new(21) = acosd(dot([old(51)-old(75), old(52)-old(76)], [old(77)-old(75), old(78)-old(76)])/(norm([old(51)-old(75), old(52)-old(76)])*norm([old(77)-old(75), old(78)-old(76)])));
  
  new(22) = acosd(dot([old(135)-old(93), old(136)-old(94)], [old(77)-old(93), old(78)-old(94)])/(norm([old(135)-old(93), old(136)-old(94)])*norm([old(77)-old(93), old(78)-old(94)])));

end
  
  
  
  
  
  
  
  
  
  
  
  