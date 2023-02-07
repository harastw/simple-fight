(defun take-hit (damage hp)
  (format t "hit! hp is: ~A~%" (- hp damage))
  (- hp damage))

(defun gen-hit ()
  (format t "Please enter damage~%")
  (let ((damage (read)))
    (if (numberp damage)
	damage
	(gen-hit))))

(defun fight (hp-enemy hp-hero)
  (if (< hp-hero 1)
      (format t "lose~%")
      (if (< hp-enemy 1)
	  (format t "win~%")
	(fight (take-hit (gen-hit)
			    hp-enemy)
		  (take-hit (gen-hit)
			    hp-hero))))) ;; attack on 1.hero 2.enemy
	 
(defun menu ()
  (progn
    (format t "go next?~%")
    (let ((go-out? (read)))
      (if (= go-out? 1)
	  t
	  nil))))
(menu)

(defun game ()
  (progn
    (format t "enter enemy's hp and hero's hp:")
    (let
	((hp-enemy (read))
	 (hp-hero  (read)))
      (fight hp-enemy hp-hero)
      (if (menu)
	  (game)
	  (format t "end.~%")))))
(game)
