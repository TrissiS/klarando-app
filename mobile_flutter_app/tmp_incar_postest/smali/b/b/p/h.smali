.class public Lb/b/p/h;
.super Ljava/lang/Object;
.source "ViewPropertyAnimatorCompatSet.java"


# instance fields
.field public final a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/h/m/c0;",
            ">;"
        }
    .end annotation
.end field

.field public b:J

.field public c:Landroid/view/animation/Interpolator;

.field public d:Lb/h/m/d0;

.field public e:Z

.field public final f:Lb/h/m/e0;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    .line 2
    iput-wide v0, p0, Lb/b/p/h;->b:J

    .line 3
    new-instance v0, Lb/b/p/h$a;

    invoke-direct {v0, p0}, Lb/b/p/h$a;-><init>(Lb/b/p/h;)V

    iput-object v0, p0, Lb/b/p/h;->f:Lb/h/m/e0;

    .line 4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/b/p/h;->a:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public a(J)Lb/b/p/h;
    .registers 4

    .line 10
    iget-boolean v0, p0, Lb/b/p/h;->e:Z

    if-nez v0, :cond_6

    .line 11
    iput-wide p1, p0, Lb/b/p/h;->b:J

    :cond_6
    return-object p0
.end method

.method public a(Landroid/view/animation/Interpolator;)Lb/b/p/h;
    .registers 3

    .line 12
    iget-boolean v0, p0, Lb/b/p/h;->e:Z

    if-nez v0, :cond_6

    .line 13
    iput-object p1, p0, Lb/b/p/h;->c:Landroid/view/animation/Interpolator;

    :cond_6
    return-object p0
.end method

.method public a(Lb/h/m/c0;)Lb/b/p/h;
    .registers 3

    .line 1
    iget-boolean v0, p0, Lb/b/p/h;->e:Z

    if-nez v0, :cond_9

    .line 2
    iget-object v0, p0, Lb/b/p/h;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_9
    return-object p0
.end method

.method public a(Lb/h/m/c0;Lb/h/m/c0;)Lb/b/p/h;
    .registers 5

    .line 3
    iget-object v0, p0, Lb/b/p/h;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    invoke-virtual {p1}, Lb/h/m/c0;->b()J

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Lb/h/m/c0;->b(J)Lb/h/m/c0;

    .line 5
    iget-object p1, p0, Lb/b/p/h;->a:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public a(Lb/h/m/d0;)Lb/b/p/h;
    .registers 3

    .line 14
    iget-boolean v0, p0, Lb/b/p/h;->e:Z

    if-nez v0, :cond_6

    .line 15
    iput-object p1, p0, Lb/b/p/h;->d:Lb/h/m/d0;

    :cond_6
    return-object p0
.end method

.method public a()V
    .registers 3

    .line 6
    iget-boolean v0, p0, Lb/b/p/h;->e:Z

    if-nez v0, :cond_5

    return-void

    .line 7
    :cond_5
    iget-object v0, p0, Lb/b/p/h;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/h/m/c0;

    .line 8
    invoke-virtual {v1}, Lb/h/m/c0;->a()V

    goto :goto_b

    :cond_1b
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lb/b/p/h;->e:Z

    return-void
.end method

.method public b()V
    .registers 2

    const/4 v0, 0x0

    .line 1
    iput-boolean v0, p0, Lb/b/p/h;->e:Z

    return-void
.end method

.method public c()V
    .registers 8

    .line 1
    iget-boolean v0, p0, Lb/b/p/h;->e:Z

    if-eqz v0, :cond_5

    return-void

    .line 2
    :cond_5
    iget-object v0, p0, Lb/b/p/h;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_36

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/h/m/c0;

    .line 3
    iget-wide v2, p0, Lb/b/p/h;->b:J

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-ltz v6, :cond_22

    .line 4
    invoke-virtual {v1, v2, v3}, Lb/h/m/c0;->a(J)Lb/h/m/c0;

    .line 5
    :cond_22
    iget-object v2, p0, Lb/b/p/h;->c:Landroid/view/animation/Interpolator;

    if-eqz v2, :cond_29

    .line 6
    invoke-virtual {v1, v2}, Lb/h/m/c0;->a(Landroid/view/animation/Interpolator;)Lb/h/m/c0;

    .line 7
    :cond_29
    iget-object v2, p0, Lb/b/p/h;->d:Lb/h/m/d0;

    if-eqz v2, :cond_32

    .line 8
    iget-object v2, p0, Lb/b/p/h;->f:Lb/h/m/e0;

    invoke-virtual {v1, v2}, Lb/h/m/c0;->a(Lb/h/m/d0;)Lb/h/m/c0;

    .line 9
    :cond_32
    invoke-virtual {v1}, Lb/h/m/c0;->c()V

    goto :goto_b

    :cond_36
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Lb/b/p/h;->e:Z

    return-void
.end method
