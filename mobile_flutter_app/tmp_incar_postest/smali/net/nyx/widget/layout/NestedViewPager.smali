.class public Lnet/nyx/widget/layout/NestedViewPager;
.super Landroidx/viewpager/widget/ViewPager;
.source "NestedViewPager.java"

# interfaces
.implements Lb/h/m/q;
.implements Lb/h/m/m;


# instance fields
.field public final q0:Lb/h/m/r;

.field public final r0:Lb/h/m/n;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lnet/nyx/widget/layout/NestedViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 2
    invoke-direct {p0, p1, p2}, Landroidx/viewpager/widget/ViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    new-instance p1, Lb/h/m/r;

    invoke-direct {p1, p0}, Lb/h/m/r;-><init>(Landroid/view/ViewGroup;)V

    iput-object p1, p0, Lnet/nyx/widget/layout/NestedViewPager;->q0:Lb/h/m/r;

    .line 4
    new-instance p1, Lb/h/m/n;

    invoke-direct {p1, p0}, Lb/h/m/n;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lnet/nyx/widget/layout/NestedViewPager;->r0:Lb/h/m/n;

    const/4 p1, 0x1

    .line 5
    invoke-virtual {p0, p1}, Lnet/nyx/widget/layout/NestedViewPager;->setNestedScrollingEnabled(Z)V

    return-void
.end method


# virtual methods
.method public dispatchNestedFling(FFZ)Z
    .registers 5

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedViewPager;->r0:Lb/h/m/n;

    invoke-virtual {v0, p1, p2, p3}, Lb/h/m/n;->a(FFZ)Z

    move-result p1

    return p1
.end method

.method public dispatchNestedPreFling(FF)Z
    .registers 4

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedViewPager;->r0:Lb/h/m/n;

    invoke-virtual {v0, p1, p2}, Lb/h/m/n;->a(FF)Z

    move-result p1

    return p1
.end method

.method public dispatchNestedPreScroll(II[I[I)Z
    .registers 6

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedViewPager;->r0:Lb/h/m/n;

    invoke-virtual {v0, p1, p2, p3, p4}, Lb/h/m/n;->a(II[I[I)Z

    move-result p1

    return p1
.end method

.method public dispatchNestedScroll(IIII[I)Z
    .registers 12

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedViewPager;->r0:Lb/h/m/n;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lb/h/m/n;->a(IIII[I)Z

    move-result p1

    return p1
.end method

.method public getNestedScrollAxes()I
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedViewPager;->q0:Lb/h/m/r;

    invoke-virtual {v0}, Lb/h/m/r;->a()I

    move-result v0

    return v0
.end method

.method public hasNestedScrollingParent()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedViewPager;->r0:Lb/h/m/n;

    invoke-virtual {v0}, Lb/h/m/n;->b()Z

    move-result v0

    return v0
.end method

.method public isNestedScrollingEnabled()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedViewPager;->r0:Lb/h/m/n;

    invoke-virtual {v0}, Lb/h/m/n;->c()Z

    move-result v0

    return v0
.end method

.method public onNestedFling(Landroid/view/View;FFZ)Z
    .registers 5

    .line 1
    invoke-virtual {p0, p2, p3, p4}, Lnet/nyx/widget/layout/NestedViewPager;->dispatchNestedFling(FFZ)Z

    move-result p1

    return p1
.end method

.method public onNestedPreFling(Landroid/view/View;FF)Z
    .registers 4

    .line 1
    invoke-virtual {p0, p2, p3}, Lnet/nyx/widget/layout/NestedViewPager;->dispatchNestedPreFling(FF)Z

    move-result p1

    return p1
.end method

.method public onNestedPreScroll(Landroid/view/View;II[I)V
    .registers 5

    const/4 p1, 0x0

    .line 1
    invoke-virtual {p0, p2, p3, p4, p1}, Lnet/nyx/widget/layout/NestedViewPager;->dispatchNestedPreScroll(II[I[I)Z

    return-void
.end method

.method public onNestedScroll(Landroid/view/View;IIII)V
    .registers 12

    const/4 v5, 0x0

    move-object v0, p0

    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    .line 1
    invoke-virtual/range {v0 .. v5}, Lnet/nyx/widget/layout/NestedViewPager;->dispatchNestedScroll(IIII[I)Z

    return-void
.end method

.method public onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V
    .registers 5

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedViewPager;->q0:Lb/h/m/r;

    invoke-virtual {v0, p1, p2, p3}, Lb/h/m/r;->a(Landroid/view/View;Landroid/view/View;I)V

    const/4 p1, 0x2

    .line 2
    invoke-virtual {p0, p1}, Lnet/nyx/widget/layout/NestedViewPager;->startNestedScroll(I)Z

    return-void
.end method

.method public onStartNestedScroll(Landroid/view/View;Landroid/view/View;I)Z
    .registers 4

    and-int/lit8 p1, p3, 0x2

    if-eqz p1, :cond_6

    const/4 p1, 0x1

    goto :goto_7

    :cond_6
    const/4 p1, 0x0

    :goto_7
    return p1
.end method

.method public onStopNestedScroll(Landroid/view/View;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedViewPager;->q0:Lb/h/m/r;

    invoke-virtual {v0, p1}, Lb/h/m/r;->a(Landroid/view/View;)V

    .line 2
    invoke-virtual {p0}, Lnet/nyx/widget/layout/NestedViewPager;->stopNestedScroll()V

    return-void
.end method

.method public setNestedScrollingEnabled(Z)V
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedViewPager;->r0:Lb/h/m/n;

    invoke-virtual {v0, p1}, Lb/h/m/n;->a(Z)V

    return-void
.end method

.method public startNestedScroll(I)Z
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedViewPager;->r0:Lb/h/m/n;

    invoke-virtual {v0, p1}, Lb/h/m/n;->c(I)Z

    move-result p1

    return p1
.end method

.method public stopNestedScroll()V
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedViewPager;->r0:Lb/h/m/n;

    invoke-virtual {v0}, Lb/h/m/n;->d()V

    return-void
.end method
