.class public abstract Lb/p/d/n;
.super Landroidx/recyclerview/widget/RecyclerView$q;
.source "SnapHelper.java"


# instance fields
.field public a:Landroidx/recyclerview/widget/RecyclerView;

.field public final b:Landroidx/recyclerview/widget/RecyclerView$s;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$q;-><init>()V

    .line 2
    new-instance v0, Lb/p/d/n$a;

    invoke-direct {v0, p0}, Lb/p/d/n$a;-><init>(Lb/p/d/n;)V

    iput-object v0, p0, Lb/p/d/n;->b:Landroidx/recyclerview/widget/RecyclerView$s;

    return-void
.end method


# virtual methods
.method public abstract a(Landroidx/recyclerview/widget/RecyclerView$o;II)I
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$o;)Landroidx/recyclerview/widget/RecyclerView$x;
    .registers 2

    .line 14
    invoke-virtual {p0, p1}, Lb/p/d/n;->b(Landroidx/recyclerview/widget/RecyclerView$o;)Lb/p/d/g;

    move-result-object p1

    return-object p1
.end method

.method public final a()V
    .registers 3

    .line 12
    iget-object v0, p0, Lb/p/d/n;->a:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lb/p/d/n;->b:Landroidx/recyclerview/widget/RecyclerView$s;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->b(Landroidx/recyclerview/widget/RecyclerView$s;)V

    .line 13
    iget-object v0, p0, Lb/p/d/n;->a:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setOnFlingListener(Landroidx/recyclerview/widget/RecyclerView$q;)V

    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 6
    iget-object v0, p0, Lb/p/d/n;->a:Landroidx/recyclerview/widget/RecyclerView;

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    if-eqz v0, :cond_a

    .line 7
    invoke-virtual {p0}, Lb/p/d/n;->a()V

    .line 8
    :cond_a
    iput-object p1, p0, Lb/p/d/n;->a:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz p1, :cond_24

    .line 9
    invoke-virtual {p0}, Lb/p/d/n;->b()V

    .line 10
    new-instance p1, Landroid/widget/Scroller;

    iget-object v0, p0, Lb/p/d/n;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-direct {p1, v0, v1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    .line 11
    invoke-virtual {p0}, Lb/p/d/n;->c()V

    :cond_24
    return-void
.end method

.method public a(II)Z
    .registers 7

    .line 1
    iget-object v0, p0, Lb/p/d/n;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_a

    return v1

    .line 2
    :cond_a
    iget-object v2, p0, Lb/p/d/n;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$g;

    move-result-object v2

    if-nez v2, :cond_13

    return v1

    .line 3
    :cond_13
    iget-object v2, p0, Lb/p/d/n;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView;->getMinFlingVelocity()I

    move-result v2

    .line 4
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result v3

    if-gt v3, v2, :cond_25

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v3

    if-le v3, v2, :cond_2c

    .line 5
    :cond_25
    invoke-virtual {p0, v0, p1, p2}, Lb/p/d/n;->b(Landroidx/recyclerview/widget/RecyclerView$o;II)Z

    move-result p1

    if-eqz p1, :cond_2c

    const/4 v1, 0x1

    :cond_2c
    return v1
.end method

.method public abstract a(Landroidx/recyclerview/widget/RecyclerView$o;Landroid/view/View;)[I
.end method

.method public abstract b(Landroidx/recyclerview/widget/RecyclerView$o;)Lb/p/d/g;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public final b()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lb/p/d/n;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getOnFlingListener()Landroidx/recyclerview/widget/RecyclerView$q;

    move-result-object v0

    if-nez v0, :cond_15

    .line 2
    iget-object v0, p0, Lb/p/d/n;->a:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lb/p/d/n;->b:Landroidx/recyclerview/widget/RecyclerView$s;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->a(Landroidx/recyclerview/widget/RecyclerView$s;)V

    .line 3
    iget-object v0, p0, Lb/p/d/n;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setOnFlingListener(Landroidx/recyclerview/widget/RecyclerView$q;)V

    return-void

    .line 4
    :cond_15
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "An instance of OnFlingListener already set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final b(Landroidx/recyclerview/widget/RecyclerView$o;II)Z
    .registers 6

    .line 5
    instance-of v0, p1, Landroidx/recyclerview/widget/RecyclerView$x$b;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 6
    :cond_6
    invoke-virtual {p0, p1}, Lb/p/d/n;->a(Landroidx/recyclerview/widget/RecyclerView$o;)Landroidx/recyclerview/widget/RecyclerView$x;

    move-result-object v0

    if-nez v0, :cond_d

    return v1

    .line 7
    :cond_d
    invoke-virtual {p0, p1, p2, p3}, Lb/p/d/n;->a(Landroidx/recyclerview/widget/RecyclerView$o;II)I

    move-result p2

    const/4 p3, -0x1

    if-ne p2, p3, :cond_15

    return v1

    .line 8
    :cond_15
    invoke-virtual {v0, p2}, Landroidx/recyclerview/widget/RecyclerView$x;->c(I)V

    .line 9
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->b(Landroidx/recyclerview/widget/RecyclerView$x;)V

    const/4 p1, 0x1

    return p1
.end method

.method public abstract c(Landroidx/recyclerview/widget/RecyclerView$o;)Landroid/view/View;
.end method

.method public c()V
    .registers 5

    .line 1
    iget-object v0, p0, Lb/p/d/n;->a:Landroidx/recyclerview/widget/RecyclerView;

    if-nez v0, :cond_5

    return-void

    .line 2
    :cond_5
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    move-result-object v0

    if-nez v0, :cond_c

    return-void

    .line 3
    :cond_c
    invoke-virtual {p0, v0}, Lb/p/d/n;->c(Landroidx/recyclerview/widget/RecyclerView$o;)Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_13

    return-void

    .line 4
    :cond_13
    invoke-virtual {p0, v0, v1}, Lb/p/d/n;->a(Landroidx/recyclerview/widget/RecyclerView$o;Landroid/view/View;)[I

    move-result-object v0

    const/4 v1, 0x0

    .line 5
    aget v2, v0, v1

    const/4 v3, 0x1

    if-nez v2, :cond_21

    aget v2, v0, v3

    if-eqz v2, :cond_2a

    .line 6
    :cond_21
    iget-object v2, p0, Lb/p/d/n;->a:Landroidx/recyclerview/widget/RecyclerView;

    aget v1, v0, v1

    aget v0, v0, v3

    invoke-virtual {v2, v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->j(II)V

    :cond_2a
    return-void
.end method
