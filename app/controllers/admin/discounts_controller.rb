  def show
    @discounts = discount.find(params[:brand] [:form] [:dosage] [:quantity] [:price] [:pharmacy])
  end

  def update
   @discounts = Discount.find(params[:brand] [:form] [:dosage] [:quantity] [:price] [:pharmacy])
   @discounts.save
   # Would it be redirecting to discounts or supplies path, since it would be discounts on supplies?
   redirect_to discounts_path(@discounts)
  end

  def create
    Discount.create(discount: params[:brand] [:form] [:dosage] [:quantity] [:price] [:pharmacy])
    redirect_to discounts_path
  end

  def edit
    @discounts = Discount.find(params[:brand] [:form] [:dosage] [:quantity] [:price] [:pharmacy])
  end

  def destroy
   Discount.find(params[:brand] [:form] [:dosage] [:quantity] [:price] [:pharmacy]).destroy
   redirect_to discounts_path
  end
end
