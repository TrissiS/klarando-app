.class public abstract Landroidx/recyclerview/widget/RecyclerView$x;
.super Ljava/lang/Object;
.source "RecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "x"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/recyclerview/widget/RecyclerView$x$b;,
        Landroidx/recyclerview/widget/RecyclerView$x$a;
    }
.end annotation


# instance fields
.field public a:I

.field public b:Landroidx/recyclerview/widget/RecyclerView;

.field public c:Landroidx/recyclerview/widget/RecyclerView$o;

.field public d:Z

.field public e:Z

.field public f:Landroid/view/View;

.field public final g:Landroidx/recyclerview/widget/RecyclerView$x$a;

.field public h:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Landroidx/recyclerview/widget/RecyclerView$x;->a:I

    .line 3
    new-instance v0, Landroidx/recyclerview/widget/RecyclerView$x$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Landroidx/recyclerview/widget/RecyclerView$x$a;-><init>(II)V

    iput-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$x;->g:Landroidx/recyclerview/widget/RecyclerView$x$a;

    return-void
.end method


# virtual methods
.method public a()I
    .registers 2

    .line 50
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$x;->b:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->t:Landroidx/recyclerview/widget/RecyclerView$o;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    return v0
.end method

.method public a(Landroid/view/View;)I
    .registers 3

    .line 49
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$x;->b:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->e(Landroid/view/View;)I

    move-result p1

    return p1
.end method

.method public a(I)Landroid/graphics/PointF;
    .registers 4

    .line 17
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$x;->b()Landroidx/recyclerview/widget/RecyclerView$o;

    move-result-object v0

    .line 18
    instance-of v1, v0, Landroidx/recyclerview/widget/RecyclerView$x$b;

    if-eqz v1, :cond_f

    .line 19
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$x$b;

    .line 20
    invoke-interface {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$x$b;->a(I)Landroid/graphics/PointF;

    move-result-object p1

    return-object p1

    .line 21
    :cond_f
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "You should override computeScrollVectorForPosition when the LayoutManager does not implement "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-class v0, Landroidx/recyclerview/widget/RecyclerView$x$b;

    .line 22
    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "RecyclerView"

    .line 23
    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return-object p1
.end method

.method public a(II)V
    .registers 8

    .line 24
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$x;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 25
    iget v1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->a:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_9

    if-nez v0, :cond_c

    .line 26
    :cond_9
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$x;->h()V

    .line 27
    :cond_c
    iget-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->d:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_3f

    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->f:Landroid/view/View;

    if-nez v1, :cond_3f

    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->c:Landroidx/recyclerview/widget/RecyclerView$o;

    if-eqz v1, :cond_3f

    .line 28
    iget v1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->a:I

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$x;->a(I)Landroid/graphics/PointF;

    move-result-object v1

    if-eqz v1, :cond_3f

    .line 29
    iget v3, v1, Landroid/graphics/PointF;->x:F

    const/4 v4, 0x0

    cmpl-float v3, v3, v4

    if-nez v3, :cond_2e

    iget v3, v1, Landroid/graphics/PointF;->y:F

    cmpl-float v3, v3, v4

    if-eqz v3, :cond_3f

    .line 30
    :cond_2e
    iget v3, v1, Landroid/graphics/PointF;->x:F

    .line 31
    invoke-static {v3}, Ljava/lang/Math;->signum(F)F

    move-result v3

    float-to-int v3, v3

    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 32
    invoke-static {v1}, Ljava/lang/Math;->signum(F)F

    move-result v1

    float-to-int v1, v1

    .line 33
    invoke-virtual {v0, v3, v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->a(II[I)V

    :cond_3f
    const/4 v1, 0x0

    .line 34
    iput-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->d:Z

    .line 35
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->f:Landroid/view/View;

    if-eqz v1, :cond_69

    .line 36
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$x;->a(Landroid/view/View;)I

    move-result v1

    iget v3, p0, Landroidx/recyclerview/widget/RecyclerView$x;->a:I

    if-ne v1, v3, :cond_60

    .line 37
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->f:Landroid/view/View;

    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView$x;->g:Landroidx/recyclerview/widget/RecyclerView$x$a;

    invoke-virtual {p0, v1, v2, v3}, Landroidx/recyclerview/widget/RecyclerView$x;->a(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/RecyclerView$x$a;)V

    .line 38
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->g:Landroidx/recyclerview/widget/RecyclerView$x$a;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView$x$a;->a(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 39
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$x;->h()V

    goto :goto_69

    :cond_60
    const-string v1, "RecyclerView"

    const-string v3, "Passed over target position while smooth scrolling."

    .line 40
    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    iput-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$x;->f:Landroid/view/View;

    .line 42
    :cond_69
    :goto_69
    iget-boolean v1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->e:Z

    if-eqz v1, :cond_8d

    .line 43
    iget-object v1, v0, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$x;->g:Landroidx/recyclerview/widget/RecyclerView$x$a;

    invoke-virtual {p0, p1, p2, v1, v2}, Landroidx/recyclerview/widget/RecyclerView$x;->a(IILandroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/RecyclerView$x$a;)V

    .line 44
    iget-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->g:Landroidx/recyclerview/widget/RecyclerView$x$a;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$x$a;->a()Z

    move-result p1

    .line 45
    iget-object p2, p0, Landroidx/recyclerview/widget/RecyclerView$x;->g:Landroidx/recyclerview/widget/RecyclerView$x$a;

    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView$x$a;->a(Landroidx/recyclerview/widget/RecyclerView;)V

    if-eqz p1, :cond_8d

    .line 46
    iget-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->e:Z

    if-eqz p1, :cond_8d

    const/4 p1, 0x1

    .line 47
    iput-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->d:Z

    .line 48
    iget-object p1, v0, Landroidx/recyclerview/widget/RecyclerView;->l0:Landroidx/recyclerview/widget/RecyclerView$a0;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$a0;->b()V

    :cond_8d
    return-void
.end method

.method public abstract a(IILandroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/RecyclerView$x$a;)V
.end method

.method public a(Landroid/graphics/PointF;)V
    .registers 4

    .line 51
    iget v0, p1, Landroid/graphics/PointF;->x:F

    mul-float v0, v0, v0

    iget v1, p1, Landroid/graphics/PointF;->y:F

    mul-float v1, v1, v1

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    .line 52
    iget v1, p1, Landroid/graphics/PointF;->x:F

    div-float/2addr v1, v0

    iput v1, p1, Landroid/graphics/PointF;->x:F

    .line 53
    iget v1, p1, Landroid/graphics/PointF;->y:F

    div-float/2addr v1, v0

    iput v1, p1, Landroid/graphics/PointF;->y:F

    return-void
.end method

.method public abstract a(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/RecyclerView$x$a;)V
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$o;)V
    .registers 5

    .line 1
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView;->l0:Landroidx/recyclerview/widget/RecyclerView$a0;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()V

    .line 2
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView$x;->h:Z

    if-eqz v0, :cond_3c

    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "An instance of "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " was started more than once. Each instance of"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " is intended to only be used once. You should create a new instance for each use."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "RecyclerView"

    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    :cond_3c
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->b:Landroidx/recyclerview/widget/RecyclerView;

    .line 7
    iput-object p2, p0, Landroidx/recyclerview/widget/RecyclerView$x;->c:Landroidx/recyclerview/widget/RecyclerView$o;

    .line 8
    iget p2, p0, Landroidx/recyclerview/widget/RecyclerView$x;->a:I

    const/4 v0, -0x1

    if-eq p2, v0, :cond_65

    .line 9
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    iput p2, p1, Landroidx/recyclerview/widget/RecyclerView$y;->a:I

    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->e:Z

    .line 11
    iput-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->d:Z

    .line 12
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$x;->c()I

    move-result p2

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$x;->b(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Landroidx/recyclerview/widget/RecyclerView$x;->f:Landroid/view/View;

    .line 13
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$x;->f()V

    .line 14
    iget-object p2, p0, Landroidx/recyclerview/widget/RecyclerView$x;->b:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p2, p2, Landroidx/recyclerview/widget/RecyclerView;->l0:Landroidx/recyclerview/widget/RecyclerView$a0;

    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$a0;->b()V

    .line 15
    iput-boolean p1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->h:Z

    return-void

    .line 16
    :cond_65
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Invalid target position"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public b(I)Landroid/view/View;
    .registers 3

    .line 2
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$x;->b:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->t:Landroidx/recyclerview/widget/RecyclerView$o;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->c(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public b()Landroidx/recyclerview/widget/RecyclerView$o;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$x;->c:Landroidx/recyclerview/widget/RecyclerView$o;

    return-object v0
.end method

.method public b(Landroid/view/View;)V
    .registers 4

    .line 3
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$x;->a(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$x;->c()I

    move-result v1

    if-ne v0, v1, :cond_c

    .line 4
    iput-object p1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->f:Landroid/view/View;

    :cond_c
    return-void
.end method

.method public c()I
    .registers 2

    .line 2
    iget v0, p0, Landroidx/recyclerview/widget/RecyclerView$x;->a:I

    return v0
.end method

.method public c(I)V
    .registers 2

    .line 1
    iput p1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->a:I

    return-void
.end method

.method public d()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView$x;->d:Z

    return v0
.end method

.method public e()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView$x;->e:Z

    return v0
.end method

.method public abstract f()V
.end method

.method public abstract g()V
.end method

.method public final h()V
    .registers 4

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView$x;->e:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView$x;->e:Z

    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$x;->g()V

    .line 4
    iget-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->b:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    const/4 v2, -0x1

    iput v2, v1, Landroidx/recyclerview/widget/RecyclerView$y;->a:I

    const/4 v1, 0x0

    .line 5
    iput-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->f:Landroid/view/View;

    .line 6
    iput v2, p0, Landroidx/recyclerview/widget/RecyclerView$x;->a:I

    .line 7
    iput-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView$x;->d:Z

    .line 8
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView$x;->c:Landroidx/recyclerview/widget/RecyclerView$o;

    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroidx/recyclerview/widget/RecyclerView$x;)V

    .line 9
    iput-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->c:Landroidx/recyclerview/widget/RecyclerView$o;

    .line 10
    iput-object v1, p0, Landroidx/recyclerview/widget/RecyclerView$x;->b:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method
