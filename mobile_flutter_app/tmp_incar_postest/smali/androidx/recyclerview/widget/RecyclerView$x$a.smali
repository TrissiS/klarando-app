.class public Landroidx/recyclerview/widget/RecyclerView$x$a;
.super Ljava/lang/Object;
.source "RecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/RecyclerView$x;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:Landroid/view/animation/Interpolator;

.field public f:Z

.field public g:I


# direct methods
.method public constructor <init>(II)V
    .registers 5

    const/high16 v0, -0x80000000

    const/4 v1, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$x$a;-><init>(IIILandroid/view/animation/Interpolator;)V

    return-void
.end method

.method public constructor <init>(IIILandroid/view/animation/Interpolator;)V
    .registers 6

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 3
    iput v0, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->d:I

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->f:Z

    .line 5
    iput v0, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->g:I

    .line 6
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->a:I

    .line 7
    iput p2, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->b:I

    .line 8
    iput p3, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->c:I

    .line 9
    iput-object p4, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->e:Landroid/view/animation/Interpolator;

    return-void
.end method


# virtual methods
.method public a(I)V
    .registers 2

    .line 1
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->d:I

    return-void
.end method

.method public a(IIILandroid/view/animation/Interpolator;)V
    .registers 5

    .line 14
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->a:I

    .line 15
    iput p2, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->b:I

    .line 16
    iput p3, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->c:I

    .line 17
    iput-object p4, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->e:Landroid/view/animation/Interpolator;

    const/4 p1, 0x1

    .line 18
    iput-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->f:Z

    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 7

    .line 3
    iget v0, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->d:I

    const/4 v1, 0x0

    if-ltz v0, :cond_e

    const/4 v2, -0x1

    .line 4
    iput v2, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->d:I

    .line 5
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->c(I)V

    .line 6
    iput-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->f:Z

    return-void

    .line 7
    :cond_e
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->f:Z

    if-eqz v0, :cond_36

    .line 8
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$x$a;->b()V

    .line 9
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView;->l0:Landroidx/recyclerview/widget/RecyclerView$a0;

    iget v0, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->a:I

    iget v2, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->b:I

    iget v3, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->c:I

    iget-object v4, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->e:Landroid/view/animation/Interpolator;

    invoke-virtual {p1, v0, v2, v3, v4}, Landroidx/recyclerview/widget/RecyclerView$a0;->a(IIILandroid/view/animation/Interpolator;)V

    .line 10
    iget p1, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->g:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->g:I

    const/16 v0, 0xa

    if-le p1, v0, :cond_33

    const-string p1, "RecyclerView"

    const-string v0, "Smooth Scroll action is being updated too frequently. Make sure you are not changing it unless necessary"

    .line 11
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    :cond_33
    iput-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->f:Z

    goto :goto_38

    .line 13
    :cond_36
    iput v1, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->g:I

    :goto_38
    return-void
.end method

.method public a()Z
    .registers 2

    .line 2
    iget v0, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->d:I

    if-ltz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public final b()V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->e:Landroid/view/animation/Interpolator;

    const/4 v1, 0x1

    if-eqz v0, :cond_12

    iget v0, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->c:I

    if-lt v0, v1, :cond_a

    goto :goto_12

    .line 2
    :cond_a
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "If you provide an interpolator, you must set a positive duration"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 3
    :cond_12
    :goto_12
    iget v0, p0, Landroidx/recyclerview/widget/RecyclerView$x$a;->c:I

    if-lt v0, v1, :cond_17

    return-void

    .line 4
    :cond_17
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Scroll duration must be a positive number"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
