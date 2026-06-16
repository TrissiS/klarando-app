.class public Landroidx/viewpager/widget/ViewPager$g;
.super Lb/h/m/a;
.source "ViewPager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/viewpager/widget/ViewPager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "g"
.end annotation


# instance fields
.field public final synthetic d:Landroidx/viewpager/widget/ViewPager;


# direct methods
.method public constructor <init>(Landroidx/viewpager/widget/ViewPager;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/viewpager/widget/ViewPager$g;->d:Landroidx/viewpager/widget/ViewPager;

    invoke-direct {p0}, Lb/h/m/a;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Lb/h/m/h0/c;)V
    .registers 4

    .line 1
    invoke-super {p0, p1, p2}, Lb/h/m/a;->a(Landroid/view/View;Lb/h/m/h0/c;)V

    .line 2
    const-class p1, Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lb/h/m/h0/c;->a(Ljava/lang/CharSequence;)V

    .line 3
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager$g;->b()Z

    move-result p1

    invoke-virtual {p2, p1}, Lb/h/m/h0/c;->l(Z)V

    .line 4
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager$g;->d:Landroidx/viewpager/widget/ViewPager;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->canScrollHorizontally(I)Z

    move-result p1

    if-eqz p1, :cond_21

    const/16 p1, 0x1000

    .line 5
    invoke-virtual {p2, p1}, Lb/h/m/h0/c;->a(I)V

    .line 6
    :cond_21
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager$g;->d:Landroidx/viewpager/widget/ViewPager;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->canScrollHorizontally(I)Z

    move-result p1

    if-eqz p1, :cond_2f

    const/16 p1, 0x2000

    .line 7
    invoke-virtual {p2, p1}, Lb/h/m/h0/c;->a(I)V

    :cond_2f
    return-void
.end method

.method public a(Landroid/view/View;ILandroid/os/Bundle;)Z
    .registers 5

    .line 8
    invoke-super {p0, p1, p2, p3}, Lb/h/m/a;->a(Landroid/view/View;ILandroid/os/Bundle;)Z

    move-result p1

    const/4 p3, 0x1

    if-eqz p1, :cond_8

    return p3

    :cond_8
    const/16 p1, 0x1000

    const/4 v0, 0x0

    if-eq p2, p1, :cond_25

    const/16 p1, 0x2000

    if-eq p2, p1, :cond_12

    return v0

    .line 9
    :cond_12
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager$g;->d:Landroidx/viewpager/widget/ViewPager;

    const/4 p2, -0x1

    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->canScrollHorizontally(I)Z

    move-result p1

    if-eqz p1, :cond_24

    .line 10
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager$g;->d:Landroidx/viewpager/widget/ViewPager;

    iget p2, p1, Landroidx/viewpager/widget/ViewPager;->m:I

    sub-int/2addr p2, p3

    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    return p3

    :cond_24
    return v0

    .line 11
    :cond_25
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager$g;->d:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {p1, p3}, Landroidx/viewpager/widget/ViewPager;->canScrollHorizontally(I)Z

    move-result p1

    if-eqz p1, :cond_36

    .line 12
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager$g;->d:Landroidx/viewpager/widget/ViewPager;

    iget p2, p1, Landroidx/viewpager/widget/ViewPager;->m:I

    add-int/2addr p2, p3

    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    return p3

    :cond_36
    return v0
.end method

.method public b(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 4

    .line 1
    invoke-super {p0, p1, p2}, Lb/h/m/a;->b(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    const-class p1, Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    .line 3
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager$g;->b()Z

    move-result p1

    invoke-virtual {p2, p1}, Landroid/view/accessibility/AccessibilityEvent;->setScrollable(Z)V

    .line 4
    invoke-virtual {p2}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result p1

    const/16 v0, 0x1000

    if-ne p1, v0, :cond_36

    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager$g;->d:Landroidx/viewpager/widget/ViewPager;

    iget-object p1, p1, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    if-eqz p1, :cond_36

    .line 5
    invoke-virtual {p1}, Lb/v/a/a;->a()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/view/accessibility/AccessibilityEvent;->setItemCount(I)V

    .line 6
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager$g;->d:Landroidx/viewpager/widget/ViewPager;

    iget p1, p1, Landroidx/viewpager/widget/ViewPager;->m:I

    invoke-virtual {p2, p1}, Landroid/view/accessibility/AccessibilityEvent;->setFromIndex(I)V

    .line 7
    iget-object p1, p0, Landroidx/viewpager/widget/ViewPager$g;->d:Landroidx/viewpager/widget/ViewPager;

    iget p1, p1, Landroidx/viewpager/widget/ViewPager;->m:I

    invoke-virtual {p2, p1}, Landroid/view/accessibility/AccessibilityEvent;->setToIndex(I)V

    :cond_36
    return-void
.end method

.method public final b()Z
    .registers 3

    .line 8
    iget-object v0, p0, Landroidx/viewpager/widget/ViewPager$g;->d:Landroidx/viewpager/widget/ViewPager;

    iget-object v0, v0, Landroidx/viewpager/widget/ViewPager;->l:Lb/v/a/a;

    const/4 v1, 0x1

    if-eqz v0, :cond_e

    invoke-virtual {v0}, Lb/v/a/a;->a()I

    move-result v0

    if-le v0, v1, :cond_e

    goto :goto_f

    :cond_e
    const/4 v1, 0x0

    :goto_f
    return v1
.end method
