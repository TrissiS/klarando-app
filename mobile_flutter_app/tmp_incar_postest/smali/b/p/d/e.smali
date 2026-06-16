.class public final Lb/p/d/e;
.super Ljava/lang/Object;
.source "GapWorker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/p/d/e$b;,
        Lb/p/d/e$c;
    }
.end annotation


# static fields
.field public static final l:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Lb/p/d/e;",
            ">;"
        }
    .end annotation
.end field

.field public static m:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lb/p/d/e$c;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public h:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/recyclerview/widget/RecyclerView;",
            ">;"
        }
    .end annotation
.end field

.field public i:J

.field public j:J

.field public k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/p/d/e$c;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lb/p/d/e;->l:Ljava/lang/ThreadLocal;

    .line 2
    new-instance v0, Lb/p/d/e$a;

    invoke-direct {v0}, Lb/p/d/e$a;-><init>()V

    sput-object v0, Lb/p/d/e;->m:Ljava/util/Comparator;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/p/d/e;->h:Ljava/util/ArrayList;

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/p/d/e;->k:Ljava/util/ArrayList;

    return-void
.end method

.method public static a(Landroidx/recyclerview/widget/RecyclerView;I)Z
    .registers 7

    .line 30
    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->l:Lb/p/d/b;

    invoke-virtual {v0}, Lb/p/d/b;->b()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v0, :cond_23

    .line 31
    iget-object v3, p0, Landroidx/recyclerview/widget/RecyclerView;->l:Lb/p/d/b;

    invoke-virtual {v3, v2}, Lb/p/d/b;->e(I)Landroid/view/View;

    move-result-object v3

    .line 32
    invoke-static {v3}, Landroidx/recyclerview/widget/RecyclerView;->m(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$b0;

    move-result-object v3

    .line 33
    iget v4, v3, Landroidx/recyclerview/widget/RecyclerView$b0;->j:I

    if-ne v4, p1, :cond_20

    invoke-virtual {v3}, Landroidx/recyclerview/widget/RecyclerView$b0;->p()Z

    move-result v3

    if-nez v3, :cond_20

    const/4 p0, 0x1

    return p0

    :cond_20
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_23
    return v1
.end method


# virtual methods
.method public final a(Landroidx/recyclerview/widget/RecyclerView;IJ)Landroidx/recyclerview/widget/RecyclerView$b0;
    .registers 7

    .line 34
    invoke-static {p1, p2}, Lb/p/d/e;->a(Landroidx/recyclerview/widget/RecyclerView;I)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p1, 0x0

    return-object p1

    .line 35
    :cond_8
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView;->i:Landroidx/recyclerview/widget/RecyclerView$u;

    const/4 v1, 0x0

    .line 36
    :try_start_b
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->z()V

    .line 37
    invoke-virtual {v0, p2, v1, p3, p4}, Landroidx/recyclerview/widget/RecyclerView$u;->a(IZJ)Landroidx/recyclerview/widget/RecyclerView$b0;

    move-result-object p2

    if-eqz p2, :cond_29

    .line 38
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$b0;->o()Z

    move-result p3

    if-eqz p3, :cond_26

    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$b0;->p()Z

    move-result p3

    if-nez p3, :cond_26

    .line 39
    iget-object p3, p2, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    invoke-virtual {v0, p3}, Landroidx/recyclerview/widget/RecyclerView$u;->b(Landroid/view/View;)V

    goto :goto_29

    .line 40
    :cond_26
    invoke-virtual {v0, p2, v1}, Landroidx/recyclerview/widget/RecyclerView$u;->a(Landroidx/recyclerview/widget/RecyclerView$b0;Z)V
    :try_end_29
    .catchall {:try_start_b .. :try_end_29} :catchall_2d

    .line 41
    :cond_29
    :goto_29
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->a(Z)V

    return-object p2

    :catchall_2d
    move-exception p2

    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->a(Z)V

    .line 42
    throw p2
.end method

.method public final a()V
    .registers 12

    .line 7
    iget-object v0, p0, Lb/p/d/e;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_9
    if-ge v2, v0, :cond_26

    .line 8
    iget-object v4, p0, Lb/p/d/e;->h:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/recyclerview/widget/RecyclerView;

    .line 9
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getWindowVisibility()I

    move-result v5

    if-nez v5, :cond_23

    .line 10
    iget-object v5, v4, Landroidx/recyclerview/widget/RecyclerView;->n0:Lb/p/d/e$b;

    invoke-virtual {v5, v4, v1}, Lb/p/d/e$b;->a(Landroidx/recyclerview/widget/RecyclerView;Z)V

    .line 11
    iget-object v4, v4, Landroidx/recyclerview/widget/RecyclerView;->n0:Lb/p/d/e$b;

    iget v4, v4, Lb/p/d/e$b;->d:I

    add-int/2addr v3, v4

    :cond_23
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 12
    :cond_26
    iget-object v2, p0, Lb/p/d/e;->k:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->ensureCapacity(I)V

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_2d
    if-ge v2, v0, :cond_90

    .line 13
    iget-object v4, p0, Lb/p/d/e;->h:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/recyclerview/widget/RecyclerView;

    .line 14
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getWindowVisibility()I

    move-result v5

    if-eqz v5, :cond_3e

    goto :goto_8d

    .line 15
    :cond_3e
    iget-object v5, v4, Landroidx/recyclerview/widget/RecyclerView;->n0:Lb/p/d/e$b;

    .line 16
    iget v6, v5, Lb/p/d/e$b;->a:I

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v6

    iget v7, v5, Lb/p/d/e$b;->b:I

    .line 17
    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v7

    add-int/2addr v6, v7

    const/4 v7, 0x0

    .line 18
    :goto_4e
    iget v8, v5, Lb/p/d/e$b;->d:I

    mul-int/lit8 v8, v8, 0x2

    if-ge v7, v8, :cond_8d

    .line 19
    iget-object v8, p0, Lb/p/d/e;->k:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lt v3, v8, :cond_67

    .line 20
    new-instance v8, Lb/p/d/e$c;

    invoke-direct {v8}, Lb/p/d/e$c;-><init>()V

    .line 21
    iget-object v9, p0, Lb/p/d/e;->k:Ljava/util/ArrayList;

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6f

    .line 22
    :cond_67
    iget-object v8, p0, Lb/p/d/e;->k:Ljava/util/ArrayList;

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lb/p/d/e$c;

    .line 23
    :goto_6f
    iget-object v9, v5, Lb/p/d/e$b;->c:[I

    add-int/lit8 v10, v7, 0x1

    aget v9, v9, v10

    if-gt v9, v6, :cond_79

    const/4 v10, 0x1

    goto :goto_7a

    :cond_79
    const/4 v10, 0x0

    .line 24
    :goto_7a
    iput-boolean v10, v8, Lb/p/d/e$c;->a:Z

    .line 25
    iput v6, v8, Lb/p/d/e$c;->b:I

    .line 26
    iput v9, v8, Lb/p/d/e$c;->c:I

    .line 27
    iput-object v4, v8, Lb/p/d/e$c;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 28
    iget-object v9, v5, Lb/p/d/e$b;->c:[I

    aget v9, v9, v7

    iput v9, v8, Lb/p/d/e$c;->e:I

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v7, v7, 0x2

    goto :goto_4e

    :cond_8d
    :goto_8d
    add-int/lit8 v2, v2, 0x1

    goto :goto_2d

    .line 29
    :cond_90
    iget-object v0, p0, Lb/p/d/e;->k:Ljava/util/ArrayList;

    sget-object v1, Lb/p/d/e;->m:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    return-void
.end method

.method public final a(J)V
    .registers 6

    const/4 v0, 0x0

    .line 62
    :goto_1
    iget-object v1, p0, Lb/p/d/e;->k:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1f

    .line 63
    iget-object v1, p0, Lb/p/d/e;->k:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/p/d/e$c;

    .line 64
    iget-object v2, v1, Lb/p/d/e$c;->d:Landroidx/recyclerview/widget/RecyclerView;

    if-nez v2, :cond_16

    goto :goto_1f

    .line 65
    :cond_16
    invoke-virtual {p0, v1, p1, p2}, Lb/p/d/e;->a(Lb/p/d/e$c;J)V

    .line 66
    invoke-virtual {v1}, Lb/p/d/e$c;->a()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1f
    :goto_1f
    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/p/d/e;->h:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView;II)V
    .registers 9

    .line 2
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 3
    iget-wide v0, p0, Lb/p/d/e;->i:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_17

    .line 4
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getNanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lb/p/d/e;->i:J

    .line 5
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 6
    :cond_17
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView;->n0:Lb/p/d/e$b;

    invoke-virtual {p1, p2, p3}, Lb/p/d/e$b;->b(II)V

    return-void
.end method

.method public final a(Landroidx/recyclerview/widget/RecyclerView;J)V
    .registers 7

    if-nez p1, :cond_3

    return-void

    .line 43
    :cond_3
    iget-boolean v0, p1, Landroidx/recyclerview/widget/RecyclerView;->K:Z

    if-eqz v0, :cond_12

    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView;->l:Lb/p/d/b;

    .line 44
    invoke-virtual {v0}, Lb/p/d/b;->b()I

    move-result v0

    if-eqz v0, :cond_12

    .line 45
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->G()V

    .line 46
    :cond_12
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView;->n0:Lb/p/d/e$b;

    const/4 v1, 0x1

    .line 47
    invoke-virtual {v0, p1, v1}, Lb/p/d/e$b;->a(Landroidx/recyclerview/widget/RecyclerView;Z)V

    .line 48
    iget v1, v0, Lb/p/d/e$b;->d:I

    if-eqz v1, :cond_42

    :try_start_1c
    const-string v1, "RV Nested Prefetch"

    .line 49
    invoke-static {v1}, Lb/h/i/c;->a(Ljava/lang/String;)V

    .line 50
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView;->o0:Landroidx/recyclerview/widget/RecyclerView$y;

    iget-object v2, p1, Landroidx/recyclerview/widget/RecyclerView;->s:Landroidx/recyclerview/widget/RecyclerView$g;

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView$y;->a(Landroidx/recyclerview/widget/RecyclerView$g;)V

    const/4 v1, 0x0

    .line 51
    :goto_29
    iget v2, v0, Lb/p/d/e$b;->d:I

    mul-int/lit8 v2, v2, 0x2

    if-ge v1, v2, :cond_39

    .line 52
    iget-object v2, v0, Lb/p/d/e$b;->c:[I

    aget v2, v2, v1

    .line 53
    invoke-virtual {p0, p1, v2, p2, p3}, Lb/p/d/e;->a(Landroidx/recyclerview/widget/RecyclerView;IJ)Landroidx/recyclerview/widget/RecyclerView$b0;
    :try_end_36
    .catchall {:try_start_1c .. :try_end_36} :catchall_3d

    add-int/lit8 v1, v1, 0x2

    goto :goto_29

    .line 54
    :cond_39
    invoke-static {}, Lb/h/i/c;->a()V

    goto :goto_42

    :catchall_3d
    move-exception p1

    invoke-static {}, Lb/h/i/c;->a()V

    .line 55
    throw p1

    :cond_42
    :goto_42
    return-void
.end method

.method public final a(Lb/p/d/e$c;J)V
    .registers 7

    .line 56
    iget-boolean v0, p1, Lb/p/d/e$c;->a:Z

    if-eqz v0, :cond_a

    const-wide v0, 0x7fffffffffffffffL

    goto :goto_b

    :cond_a
    move-wide v0, p2

    .line 57
    :goto_b
    iget-object v2, p1, Lb/p/d/e$c;->d:Landroidx/recyclerview/widget/RecyclerView;

    iget p1, p1, Lb/p/d/e$c;->e:I

    invoke-virtual {p0, v2, p1, v0, v1}, Lb/p/d/e;->a(Landroidx/recyclerview/widget/RecyclerView;IJ)Landroidx/recyclerview/widget/RecyclerView$b0;

    move-result-object p1

    if-eqz p1, :cond_30

    .line 58
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->i:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_30

    .line 59
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->o()Z

    move-result v0

    if-eqz v0, :cond_30

    .line 60
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->p()Z

    move-result v0

    if-nez v0, :cond_30

    .line 61
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->i:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p1, p2, p3}, Lb/p/d/e;->a(Landroidx/recyclerview/widget/RecyclerView;J)V

    :cond_30
    return-void
.end method

.method public b(J)V
    .registers 3

    .line 2
    invoke-virtual {p0}, Lb/p/d/e;->a()V

    .line 3
    invoke-virtual {p0, p1, p2}, Lb/p/d/e;->a(J)V

    return-void
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/p/d/e;->h:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public run()V
    .registers 9

    const-wide/16 v0, 0x0

    :try_start_2
    const-string v2, "RV Prefetch"

    .line 1
    invoke-static {v2}, Lb/h/i/c;->a(Ljava/lang/String;)V

    .line 2
    iget-object v2, p0, Lb/p/d/e;->h:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2
    :try_end_d
    .catchall {:try_start_2 .. :try_end_d} :catchall_4f

    if-eqz v2, :cond_15

    .line 3
    :goto_f
    iput-wide v0, p0, Lb/p/d/e;->i:J

    .line 4
    invoke-static {}, Lb/h/i/c;->a()V

    return-void

    .line 5
    :cond_15
    :try_start_15
    iget-object v2, p0, Lb/p/d/e;->h:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move-wide v4, v0

    :goto_1d
    if-ge v3, v2, :cond_38

    .line 6
    iget-object v6, p0, Lb/p/d/e;->h:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/recyclerview/widget/RecyclerView;

    .line 7
    invoke-virtual {v6}, Landroid/view/ViewGroup;->getWindowVisibility()I

    move-result v7

    if-nez v7, :cond_35

    .line 8
    invoke-virtual {v6}, Landroid/view/ViewGroup;->getDrawingTime()J

    move-result-wide v6

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    :cond_35
    add-int/lit8 v3, v3, 0x1

    goto :goto_1d

    :cond_38
    cmp-long v2, v4, v0

    if-nez v2, :cond_3d

    goto :goto_f

    .line 9
    :cond_3d
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v4, v5}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v2

    iget-wide v4, p0, Lb/p/d/e;->j:J

    add-long/2addr v2, v4

    .line 10
    invoke-virtual {p0, v2, v3}, Lb/p/d/e;->b(J)V
    :try_end_49
    .catchall {:try_start_15 .. :try_end_49} :catchall_4f

    .line 11
    iput-wide v0, p0, Lb/p/d/e;->i:J

    .line 12
    invoke-static {}, Lb/h/i/c;->a()V

    return-void

    :catchall_4f
    move-exception v2

    .line 13
    iput-wide v0, p0, Lb/p/d/e;->i:J

    .line 14
    invoke-static {}, Lb/h/i/c;->a()V

    .line 15
    throw v2
.end method
