.class public Lb/p/d/j$a;
.super Lb/p/d/g;
.source "PagerSnapHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/p/d/j;->b(Landroidx/recyclerview/widget/RecyclerView$o;)Lb/p/d/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic q:Lb/p/d/j;


# direct methods
.method public constructor <init>(Lb/p/d/j;Landroid/content/Context;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lb/p/d/j$a;->q:Lb/p/d/j;

    invoke-direct {p0, p2}, Lb/p/d/g;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/util/DisplayMetrics;)F
    .registers 3

    .line 6
    iget p1, p1, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float p1, p1

    const/high16 v0, 0x42c80000    # 100.0f

    div-float/2addr v0, p1

    return v0
.end method

.method public a(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/RecyclerView$x$a;)V
    .registers 6

    .line 1
    iget-object p2, p0, Lb/p/d/j$a;->q:Lb/p/d/j;

    iget-object v0, p2, Lb/p/d/n;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    move-result-object v0

    invoke-virtual {p2, v0, p1}, Lb/p/d/j;->a(Landroidx/recyclerview/widget/RecyclerView$o;Landroid/view/View;)[I

    move-result-object p1

    const/4 p2, 0x0

    .line 2
    aget p2, p1, p2

    const/4 v0, 0x1

    .line 3
    aget p1, p1, v0

    .line 4
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result v0

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lb/p/d/g;->d(I)I

    move-result v0

    if-lez v0, :cond_29

    .line 5
    iget-object v1, p0, Lb/p/d/g;->j:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p3, p2, p1, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$x$a;->a(IIILandroid/view/animation/Interpolator;)V

    :cond_29
    return-void
.end method

.method public e(I)I
    .registers 3

    .line 1
    invoke-super {p0, p1}, Lb/p/d/g;->e(I)I

    move-result p1

    const/16 v0, 0x64

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    return p1
.end method
