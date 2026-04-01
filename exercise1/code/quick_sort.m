function [total,sorted_final] = quick_sort(sorted,high,low)
    total = 0;
    if low >= high
        sorted_final = sorted;
        total = 0;
        return;
    end

    if low<high
        [pivot,comp,sorted_final1,sorted_final2] = partition(sorted,high,low);
        [total1,sorted_final1] = quick_sort(sorted_final1,length(sorted_final1),1);
        [total2,sorted_final2] = quick_sort(sorted_final2,length(sorted_final2),1);
        total = total1 + total2 + comp;
  
        sorted_final = [sorted_final1, pivot,sorted_final2];
    end
    
end
