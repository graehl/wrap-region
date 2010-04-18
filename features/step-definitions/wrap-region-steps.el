(Given "^I \\(enable\\|disable\\) wrap-region$"
       (lambda (status)
         (if (string= status "enable")
             (turn-on-wrap-region-mode)
           (turn-off-wrap-region-mode))))

(Given "^insert twice is \\(active\\|inactive\\)$"
       (lambda (status)
         (setq wrap-region-insert-twice (string= status "active"))))

(Given "^I start html-mode$"
       (lambda ()
         (html-mode)))

(When "^I start text-mode$"
      (lambda ()
        (text-mode)))

(When "^I split the window horizontally$"
      (lambda ()
        (let ((window-min-height 0)
              (window-min-width 0))
          (split-window-horizontally))))

(When "^I go to the next window$"
      (lambda ()
        (other-window 1)))
