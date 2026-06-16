.class public final Lc/a/a/a/d0/h;
.super Ljava/lang/Object;
.source "StateListAnimator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/a/a/a/d0/h$b;
    }
.end annotation


# instance fields
.field public final a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lc/a/a/a/d0/h$b;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lc/a/a/a/d0/h$b;

.field public c:Landroid/animation/ValueAnimator;

.field public final d:Landroid/animation/Animator$AnimatorListener;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lc/a/a/a/d0/h;->a:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lc/a/a/a/d0/h;->b:Lc/a/a/a/d0/h$b;

    .line 4
    iput-object v0, p0, Lc/a/a/a/d0/h;->c:Landroid/animation/ValueAnimator;

    .line 5
    new-instance v0, Lc/a/a/a/d0/h$a;

    invoke-direct {v0, p0}, Lc/a/a/a/d0/h$a;-><init>(Lc/a/a/a/d0/h;)V

    iput-object v0, p0, Lc/a/a/a/d0/h;->d:Landroid/animation/Animator$AnimatorListener;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    .line 13
    iget-object v0, p0, Lc/a/a/a/d0/h;->c:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_a

    .line 14
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lc/a/a/a/d0/h;->c:Landroid/animation/ValueAnimator;

    :cond_a
    return-void
.end method

.method public final a(Lc/a/a/a/d0/h$b;)V
    .registers 2

    .line 11
    iget-object p1, p1, Lc/a/a/a/d0/h$b;->b:Landroid/animation/ValueAnimator;

    iput-object p1, p0, Lc/a/a/a/d0/h;->c:Landroid/animation/ValueAnimator;

    .line 12
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method public a([I)V
    .registers 6

    .line 4
    iget-object v0, p0, Lc/a/a/a/d0/h;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_1d

    .line 5
    iget-object v2, p0, Lc/a/a/a/d0/h;->a:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lc/a/a/a/d0/h$b;

    .line 6
    iget-object v3, v2, Lc/a/a/a/d0/h$b;->a:[I

    invoke-static {v3, p1}, Landroid/util/StateSet;->stateSetMatches([I[I)Z

    move-result v3

    if-eqz v3, :cond_1a

    goto :goto_1e

    :cond_1a
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_1d
    const/4 v2, 0x0

    .line 7
    :goto_1e
    iget-object p1, p0, Lc/a/a/a/d0/h;->b:Lc/a/a/a/d0/h$b;

    if-ne v2, p1, :cond_23

    return-void

    :cond_23
    if-eqz p1, :cond_28

    .line 8
    invoke-virtual {p0}, Lc/a/a/a/d0/h;->a()V

    .line 9
    :cond_28
    iput-object v2, p0, Lc/a/a/a/d0/h;->b:Lc/a/a/a/d0/h$b;

    if-eqz v2, :cond_2f

    .line 10
    invoke-virtual {p0, v2}, Lc/a/a/a/d0/h;->a(Lc/a/a/a/d0/h$b;)V

    :cond_2f
    return-void
.end method

.method public a([ILandroid/animation/ValueAnimator;)V
    .registers 4

    .line 1
    new-instance v0, Lc/a/a/a/d0/h$b;

    invoke-direct {v0, p1, p2}, Lc/a/a/a/d0/h$b;-><init>([ILandroid/animation/ValueAnimator;)V

    .line 2
    iget-object p1, p0, Lc/a/a/a/d0/h;->d:Landroid/animation/Animator$AnimatorListener;

    invoke-virtual {p2, p1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 3
    iget-object p1, p0, Lc/a/a/a/d0/h;->a:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public b()V
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/h;->c:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_a

    .line 2
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->end()V

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lc/a/a/a/d0/h;->c:Landroid/animation/ValueAnimator;

    :cond_a
    return-void
.end method
