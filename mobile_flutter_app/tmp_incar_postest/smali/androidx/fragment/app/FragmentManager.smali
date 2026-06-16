.class public abstract Landroidx/fragment/app/FragmentManager;
.super Ljava/lang/Object;
.source "FragmentManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/fragment/app/FragmentManager$k;,
        Landroidx/fragment/app/FragmentManager$LaunchedFragmentInfo;,
        Landroidx/fragment/app/FragmentManager$p;,
        Landroidx/fragment/app/FragmentManager$o;,
        Landroidx/fragment/app/FragmentManager$n;,
        Landroidx/fragment/app/FragmentManager$l;,
        Landroidx/fragment/app/FragmentManager$m;
    }
.end annotation


# static fields
.field public static O:Z = false

.field public static P:Z = true


# instance fields
.field public A:Lb/a/e/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/a/e/b<",
            "Landroidx/activity/result/IntentSenderRequest;",
            ">;"
        }
    .end annotation
.end field

.field public B:Lb/a/e/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/a/e/b<",
            "[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public C:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Landroidx/fragment/app/FragmentManager$LaunchedFragmentInfo;",
            ">;"
        }
    .end annotation
.end field

.field public D:Z

.field public E:Z

.field public F:Z

.field public G:Z

.field public H:Z

.field public I:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/l/d/a;",
            ">;"
        }
    .end annotation
.end field

.field public J:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public K:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/fragment/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field public L:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/fragment/app/FragmentManager$p;",
            ">;"
        }
    .end annotation
.end field

.field public M:Lb/l/d/l;

.field public N:Ljava/lang/Runnable;

.field public final a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/fragment/app/FragmentManager$n;",
            ">;"
        }
    .end annotation
.end field

.field public b:Z

.field public final c:Lb/l/d/p;

.field public d:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/l/d/a;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/fragment/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Lb/l/d/i;

.field public g:Landroidx/activity/OnBackPressedDispatcher;

.field public final h:Lb/a/b;

.field public final i:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final j:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation
.end field

.field public final k:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/fragment/app/FragmentManager$m;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/fragment/app/Fragment;",
            "Ljava/util/HashSet<",
            "Lb/h/i/b;",
            ">;>;"
        }
    .end annotation
.end field

.field public final n:Lb/l/d/r$g;

.field public final o:Lb/l/d/j;

.field public final p:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lb/l/d/m;",
            ">;"
        }
    .end annotation
.end field

.field public q:I

.field public r:Lb/l/d/h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/l/d/h<",
            "*>;"
        }
    .end annotation
.end field

.field public s:Lb/l/d/e;

.field public t:Landroidx/fragment/app/Fragment;

.field public u:Landroidx/fragment/app/Fragment;

.field public v:Lb/l/d/g;

.field public w:Lb/l/d/g;

.field public x:Lb/l/d/x;

.field public y:Lb/l/d/x;

.field public z:Lb/a/e/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/a/e/b<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->a:Ljava/util/ArrayList;

    .line 3
    new-instance v0, Lb/l/d/p;

    invoke-direct {v0}, Lb/l/d/p;-><init>()V

    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    .line 4
    new-instance v0, Lb/l/d/i;

    invoke-direct {v0, p0}, Lb/l/d/i;-><init>(Landroidx/fragment/app/FragmentManager;)V

    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->f:Lb/l/d/i;

    .line 5
    new-instance v0, Landroidx/fragment/app/FragmentManager$c;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/fragment/app/FragmentManager$c;-><init>(Landroidx/fragment/app/FragmentManager;Z)V

    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->h:Lb/a/b;

    .line 6
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->i:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 7
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 8
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->j:Ljava/util/Map;

    .line 9
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 10
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->k:Ljava/util/Map;

    .line 11
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 12
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->m:Ljava/util/Map;

    .line 13
    new-instance v0, Landroidx/fragment/app/FragmentManager$d;

    invoke-direct {v0, p0}, Landroidx/fragment/app/FragmentManager$d;-><init>(Landroidx/fragment/app/FragmentManager;)V

    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->n:Lb/l/d/r$g;

    .line 14
    new-instance v0, Lb/l/d/j;

    invoke-direct {v0, p0}, Lb/l/d/j;-><init>(Landroidx/fragment/app/FragmentManager;)V

    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->o:Lb/l/d/j;

    .line 15
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->p:Ljava/util/concurrent/CopyOnWriteArrayList;

    const/4 v0, -0x1

    .line 16
    iput v0, p0, Landroidx/fragment/app/FragmentManager;->q:I

    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->v:Lb/l/d/g;

    .line 18
    new-instance v1, Landroidx/fragment/app/FragmentManager$e;

    invoke-direct {v1, p0}, Landroidx/fragment/app/FragmentManager$e;-><init>(Landroidx/fragment/app/FragmentManager;)V

    iput-object v1, p0, Landroidx/fragment/app/FragmentManager;->w:Lb/l/d/g;

    .line 19
    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->x:Lb/l/d/x;

    .line 20
    new-instance v0, Landroidx/fragment/app/FragmentManager$f;

    invoke-direct {v0, p0}, Landroidx/fragment/app/FragmentManager$f;-><init>(Landroidx/fragment/app/FragmentManager;)V

    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->y:Lb/l/d/x;

    .line 21
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->C:Ljava/util/ArrayDeque;

    .line 22
    new-instance v0, Landroidx/fragment/app/FragmentManager$g;

    invoke-direct {v0, p0}, Landroidx/fragment/app/FragmentManager$g;-><init>(Landroidx/fragment/app/FragmentManager;)V

    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->N:Ljava/lang/Runnable;

    return-void
.end method

.method public static a(Landroid/view/View;)Landroidx/fragment/app/Fragment;
    .registers 2

    .line 21
    sget v0, Lb/l/b;->fragment_container_view_tag:I

    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p0

    .line 22
    instance-of v0, p0, Landroidx/fragment/app/Fragment;

    if-eqz v0, :cond_d

    .line 23
    check-cast p0, Landroidx/fragment/app/Fragment;

    return-object p0

    :cond_d
    const/4 p0, 0x0

    return-object p0
.end method

.method public static synthetic a(Landroidx/fragment/app/FragmentManager;)Ljava/util/Map;
    .registers 1

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/FragmentManager;->j:Ljava/util/Map;

    return-object p0
.end method

.method public static synthetic b(Landroidx/fragment/app/FragmentManager;)Ljava/util/Map;
    .registers 1

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/FragmentManager;->k:Ljava/util/Map;

    return-object p0
.end method

.method public static b(Ljava/util/ArrayList;Ljava/util/ArrayList;II)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lb/l/d/a;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Boolean;",
            ">;II)V"
        }
    .end annotation

    :goto_0
    if-ge p2, p3, :cond_2c

    .line 35
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/l/d/a;

    .line 36
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_23

    const/4 v1, -0x1

    .line 37
    invoke-virtual {v0, v1}, Lb/l/d/a;->a(I)V

    add-int/lit8 v1, p3, -0x1

    if-ne p2, v1, :cond_1e

    goto :goto_1f

    :cond_1e
    const/4 v2, 0x0

    .line 38
    :goto_1f
    invoke-virtual {v0, v2}, Lb/l/d/a;->c(Z)V

    goto :goto_29

    .line 39
    :cond_23
    invoke-virtual {v0, v2}, Lb/l/d/a;->a(I)V

    .line 40
    invoke-virtual {v0}, Lb/l/d/a;->f()V

    :goto_29
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_2c
    return-void
.end method

.method public static synthetic c(Landroidx/fragment/app/FragmentManager;)Lb/l/d/p;
    .registers 1

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    return-object p0
.end method

.method public static d(I)Z
    .registers 2

    .line 1
    sget-boolean v0, Landroidx/fragment/app/FragmentManager;->O:Z

    if-nez v0, :cond_f

    const-string v0, "FragmentManager"

    invoke-static {v0, p0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p0

    if-eqz p0, :cond_d

    goto :goto_f

    :cond_d
    const/4 p0, 0x0

    goto :goto_10

    :cond_f
    :goto_f
    const/4 p0, 0x1

    :goto_10
    return p0
.end method

.method public static e(I)I
    .registers 4

    const/16 v0, 0x2002

    const/16 v1, 0x1003

    const/16 v2, 0x1001

    if-eq p0, v2, :cond_13

    if-eq p0, v1, :cond_11

    if-eq p0, v0, :cond_e

    const/4 v0, 0x0

    goto :goto_13

    :cond_e
    const/16 v0, 0x1001

    goto :goto_13

    :cond_11
    const/16 v0, 0x1003

    :cond_13
    :goto_13
    return v0
.end method


# virtual methods
.method public A()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/fragment/app/Fragment;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v0}, Lb/l/d/p;->d()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public B()Lb/l/d/h;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lb/l/d/h<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    return-object v0
.end method

.method public C()Landroid/view/LayoutInflater$Factory2;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->f:Lb/l/d/i;

    return-object v0
.end method

.method public D()Lb/l/d/j;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->o:Lb/l/d/j;

    return-object v0
.end method

.method public E()Landroidx/fragment/app/Fragment;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->t:Landroidx/fragment/app/Fragment;

    return-object v0
.end method

.method public F()Landroidx/fragment/app/Fragment;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->u:Landroidx/fragment/app/Fragment;

    return-object v0
.end method

.method public G()Lb/l/d/x;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->x:Lb/l/d/x;

    if-eqz v0, :cond_5

    return-object v0

    .line 2
    :cond_5
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->t:Landroidx/fragment/app/Fragment;

    if-eqz v0, :cond_10

    .line 3
    iget-object v0, v0, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->G()Lb/l/d/x;

    move-result-object v0

    return-object v0

    .line 4
    :cond_10
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->y:Lb/l/d/x;

    return-object v0
.end method

.method public H()V
    .registers 2

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->d(Z)Z

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->h:Lb/a/b;

    invoke-virtual {v0}, Lb/a/b;->b()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->L()Z

    goto :goto_15

    .line 4
    :cond_10
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->g:Landroidx/activity/OnBackPressedDispatcher;

    invoke-virtual {v0}, Landroidx/activity/OnBackPressedDispatcher;->a()V

    :goto_15
    return-void
.end method

.method public I()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->G:Z

    return v0
.end method

.method public J()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->E:Z

    if-nez v0, :cond_b

    iget-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->F:Z

    if-eqz v0, :cond_9

    goto :goto_b

    :cond_9
    const/4 v0, 0x0

    goto :goto_c

    :cond_b
    :goto_b
    const/4 v0, 0x1

    :goto_c
    return v0
.end method

.method public K()V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->E:Z

    .line 3
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->F:Z

    .line 4
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->M:Lb/l/d/l;

    invoke-virtual {v1, v0}, Lb/l/d/l;->a(Z)V

    .line 5
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v0}, Lb/l/d/p;->d()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_19
    :goto_19
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    if-eqz v1, :cond_19

    .line 6
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->Y()V

    goto :goto_19

    :cond_2b
    return-void
.end method

.method public L()Z
    .registers 4

    const/4 v0, 0x0

    const/4 v1, -0x1

    const/4 v2, 0x0

    .line 1
    invoke-virtual {p0, v0, v1, v2}, Landroidx/fragment/app/FragmentManager;->a(Ljava/lang/String;II)Z

    move-result v0

    return v0
.end method

.method public final M()V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->l:Ljava/util/ArrayList;

    if-eqz v0, :cond_1b

    const/4 v0, 0x0

    .line 2
    :goto_5
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->l:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1b

    .line 3
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->l:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/FragmentManager$m;

    invoke-interface {v1}, Landroidx/fragment/app/FragmentManager$m;->a()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_1b
    return-void
.end method

.method public N()Landroid/os/Parcelable;
    .registers 10

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->v()V

    .line 2
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->t()V

    const/4 v0, 0x1

    .line 3
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->d(Z)Z

    .line 4
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->E:Z

    .line 5
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->M:Lb/l/d/l;

    invoke-virtual {v1, v0}, Lb/l/d/l;->a(Z)V

    .line 6
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v0}, Lb/l/d/p;->h()Ljava/util/ArrayList;

    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    const-string v2, "FragmentManager"

    const/4 v3, 0x2

    const/4 v4, 0x0

    if-eqz v1, :cond_2d

    .line 8
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_2c

    const-string v0, "saveAllState: no fragments!"

    invoke-static {v2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2c
    return-object v4

    .line 9
    :cond_2d
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v1}, Lb/l/d/p;->i()Ljava/util/ArrayList;

    move-result-object v1

    .line 10
    iget-object v5, p0, Landroidx/fragment/app/FragmentManager;->d:Ljava/util/ArrayList;

    if-eqz v5, :cond_7c

    .line 11
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_7c

    .line 12
    new-array v4, v5, [Landroidx/fragment/app/BackStackState;

    const/4 v6, 0x0

    :goto_40
    if-ge v6, v5, :cond_7c

    .line 13
    new-instance v7, Landroidx/fragment/app/BackStackState;

    iget-object v8, p0, Landroidx/fragment/app/FragmentManager;->d:Ljava/util/ArrayList;

    invoke-virtual {v8, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lb/l/d/a;

    invoke-direct {v7, v8}, Landroidx/fragment/app/BackStackState;-><init>(Lb/l/d/a;)V

    aput-object v7, v4, v6

    .line 14
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v7

    if-eqz v7, :cond_79

    .line 15
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "saveAllState: adding back stack #"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, p0, Landroidx/fragment/app/FragmentManager;->d:Ljava/util/ArrayList;

    .line 16
    invoke-virtual {v8, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 17
    invoke-static {v2, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_79
    add-int/lit8 v6, v6, 0x1

    goto :goto_40

    .line 18
    :cond_7c
    new-instance v2, Landroidx/fragment/app/FragmentManagerState;

    invoke-direct {v2}, Landroidx/fragment/app/FragmentManagerState;-><init>()V

    .line 19
    iput-object v0, v2, Landroidx/fragment/app/FragmentManagerState;->h:Ljava/util/ArrayList;

    .line 20
    iput-object v1, v2, Landroidx/fragment/app/FragmentManagerState;->i:Ljava/util/ArrayList;

    .line 21
    iput-object v4, v2, Landroidx/fragment/app/FragmentManagerState;->j:[Landroidx/fragment/app/BackStackState;

    .line 22
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->i:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    iput v0, v2, Landroidx/fragment/app/FragmentManagerState;->k:I

    .line 23
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->u:Landroidx/fragment/app/Fragment;

    if-eqz v0, :cond_97

    .line 24
    iget-object v0, v0, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    iput-object v0, v2, Landroidx/fragment/app/FragmentManagerState;->l:Ljava/lang/String;

    .line 25
    :cond_97
    iget-object v0, v2, Landroidx/fragment/app/FragmentManagerState;->m:Ljava/util/ArrayList;

    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->j:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 26
    iget-object v0, v2, Landroidx/fragment/app/FragmentManagerState;->n:Ljava/util/ArrayList;

    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->j:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 27
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->C:Ljava/util/ArrayDeque;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, v2, Landroidx/fragment/app/FragmentManagerState;->o:Ljava/util/ArrayList;

    return-object v2
.end method

.method public O()V
    .registers 6

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->a:Ljava/util/ArrayList;

    monitor-enter v0

    .line 2
    :try_start_3
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->L:Ljava/util/ArrayList;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_13

    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->L:Ljava/util/ArrayList;

    .line 3
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_13

    const/4 v1, 0x1

    goto :goto_14

    :cond_13
    const/4 v1, 0x0

    .line 4
    :goto_14
    iget-object v4, p0, Landroidx/fragment/app/FragmentManager;->a:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ne v4, v3, :cond_1d

    const/4 v2, 0x1

    :cond_1d
    if-nez v1, :cond_21

    if-eqz v2, :cond_3a

    .line 5
    :cond_21
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    invoke-virtual {v1}, Lb/l/d/h;->i()Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Landroidx/fragment/app/FragmentManager;->N:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 6
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    invoke-virtual {v1}, Lb/l/d/h;->i()Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Landroidx/fragment/app/FragmentManager;->N:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 7
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->Q()V

    .line 8
    :cond_3a
    monitor-exit v0

    return-void

    :catchall_3c
    move-exception v1

    monitor-exit v0
    :try_end_3e
    .catchall {:try_start_3 .. :try_end_3e} :catchall_3c

    throw v1
.end method

.method public final P()V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v0}, Lb/l/d/p;->b()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/o;

    .line 2
    invoke-virtual {p0, v1}, Landroidx/fragment/app/FragmentManager;->a(Lb/l/d/o;)V

    goto :goto_a

    :cond_1a
    return-void
.end method

.method public final Q()V
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->a:Ljava/util/ArrayList;

    monitor-enter v0

    .line 2
    :try_start_3
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_13

    .line 3
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->h:Lb/a/b;

    invoke-virtual {v1, v2}, Lb/a/b;->a(Z)V

    .line 4
    monitor-exit v0

    return-void

    .line 5
    :cond_13
    monitor-exit v0
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_2a

    .line 6
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->h:Lb/a/b;

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->w()I

    move-result v1

    if-lez v1, :cond_25

    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->t:Landroidx/fragment/app/Fragment;

    .line 7
    invoke-virtual {p0, v1}, Landroidx/fragment/app/FragmentManager;->q(Landroidx/fragment/app/Fragment;)Z

    move-result v1

    if-eqz v1, :cond_25

    goto :goto_26

    :cond_25
    const/4 v2, 0x0

    .line 8
    :goto_26
    invoke-virtual {v0, v2}, Lb/a/b;->a(Z)V

    return-void

    :catchall_2a
    move-exception v1

    .line 9
    :try_start_2b
    monitor-exit v0
    :try_end_2c
    .catchall {:try_start_2b .. :try_end_2c} :catchall_2a

    throw v1
.end method

.method public a()I
    .registers 2

    .line 191
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->i:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    return v0
.end method

.method public final a(Ljava/util/ArrayList;Ljava/util/ArrayList;IILb/e/b;)I
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lb/l/d/a;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Boolean;",
            ">;II",
            "Lb/e/b<",
            "Landroidx/fragment/app/Fragment;",
            ">;)I"
        }
    .end annotation

    add-int/lit8 v0, p4, -0x1

    move v1, p4

    :goto_3
    if-lt v0, p3, :cond_5a

    .line 266
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/l/d/a;

    .line 267
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    .line 268
    invoke-virtual {v2}, Lb/l/d/a;->h()Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_26

    add-int/lit8 v4, v0, 0x1

    .line 269
    invoke-virtual {v2, p1, v4, p4}, Lb/l/d/a;->a(Ljava/util/ArrayList;II)Z

    move-result v4

    if-nez v4, :cond_26

    const/4 v4, 0x1

    goto :goto_27

    :cond_26
    const/4 v4, 0x0

    :goto_27
    if-eqz v4, :cond_57

    .line 270
    iget-object v4, p0, Landroidx/fragment/app/FragmentManager;->L:Ljava/util/ArrayList;

    if-nez v4, :cond_34

    .line 271
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Landroidx/fragment/app/FragmentManager;->L:Ljava/util/ArrayList;

    .line 272
    :cond_34
    new-instance v4, Landroidx/fragment/app/FragmentManager$p;

    invoke-direct {v4, v2, v3}, Landroidx/fragment/app/FragmentManager$p;-><init>(Lb/l/d/a;Z)V

    .line 273
    iget-object v6, p0, Landroidx/fragment/app/FragmentManager;->L:Ljava/util/ArrayList;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 274
    invoke-virtual {v2, v4}, Lb/l/d/a;->a(Landroidx/fragment/app/Fragment$h;)V

    if-eqz v3, :cond_47

    .line 275
    invoke-virtual {v2}, Lb/l/d/a;->f()V

    goto :goto_4a

    .line 276
    :cond_47
    invoke-virtual {v2, v5}, Lb/l/d/a;->c(Z)V

    :goto_4a
    add-int/lit8 v1, v1, -0x1

    if-eq v0, v1, :cond_54

    .line 277
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 278
    invoke-virtual {p1, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 279
    :cond_54
    invoke-virtual {p0, p5}, Landroidx/fragment/app/FragmentManager;->a(Lb/e/b;)V

    :cond_57
    add-int/lit8 v0, v0, -0x1

    goto :goto_3

    :cond_5a
    return v1
.end method

.method public a(Landroidx/fragment/app/Fragment;)Lb/l/d/o;
    .registers 5

    const/4 v0, 0x2

    .line 168
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_1d

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "add: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    :cond_1d
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->e(Landroidx/fragment/app/Fragment;)Lb/l/d/o;

    move-result-object v0

    .line 170
    iput-object p0, p1, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    .line 171
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v1, v0}, Lb/l/d/p;->a(Lb/l/d/o;)V

    .line 172
    iget-boolean v1, p1, Landroidx/fragment/app/Fragment;->H:Z

    if-nez v1, :cond_43

    .line 173
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v1, p1}, Lb/l/d/p;->a(Landroidx/fragment/app/Fragment;)V

    const/4 v1, 0x0

    .line 174
    iput-boolean v1, p1, Landroidx/fragment/app/Fragment;->t:Z

    .line 175
    iget-object v2, p1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-nez v2, :cond_3a

    .line 176
    iput-boolean v1, p1, Landroidx/fragment/app/Fragment;->T:Z

    .line 177
    :cond_3a
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->o(Landroidx/fragment/app/Fragment;)Z

    move-result p1

    if-eqz p1, :cond_43

    const/4 p1, 0x1

    .line 178
    iput-boolean p1, p0, Landroidx/fragment/app/FragmentManager;->D:Z

    :cond_43
    return-object v0
.end method

.method public final a(Ljava/util/ArrayList;II)Ljava/util/Set;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lb/l/d/a;",
            ">;II)",
            "Ljava/util/Set<",
            "Lb/l/d/w;",
            ">;"
        }
    .end annotation

    .line 260
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    :goto_5
    if-ge p2, p3, :cond_32

    .line 261
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/a;

    .line 262
    iget-object v1, v1, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_13
    :goto_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/l/d/q$a;

    .line 263
    iget-object v2, v2, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    if-eqz v2, :cond_13

    .line 264
    iget-object v2, v2, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    if-eqz v2, :cond_13

    .line 265
    invoke-static {v2, p0}, Lb/l/d/w;->a(Landroid/view/ViewGroup;Landroidx/fragment/app/FragmentManager;)Lb/l/d/w;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_13

    :cond_2f
    add-int/lit8 p2, p2, 0x1

    goto :goto_5

    :cond_32
    return-object v0
.end method

.method public final a(I)V
    .registers 5

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 402
    :try_start_2
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->b:Z

    .line 403
    iget-object v2, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v2, p1}, Lb/l/d/p;->a(I)V

    .line 404
    invoke-virtual {p0, p1, v1}, Landroidx/fragment/app/FragmentManager;->a(IZ)V

    .line 405
    sget-boolean p1, Landroidx/fragment/app/FragmentManager;->P:Z

    if-eqz p1, :cond_28

    .line 406
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->f()Ljava/util/Set;

    move-result-object p1

    .line 407
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_18
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_28

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/l/d/w;

    .line 408
    invoke-virtual {v2}, Lb/l/d/w;->b()V
    :try_end_27
    .catchall {:try_start_2 .. :try_end_27} :catchall_2e

    goto :goto_18

    .line 409
    :cond_28
    iput-boolean v1, p0, Landroidx/fragment/app/FragmentManager;->b:Z

    .line 410
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->d(Z)Z

    return-void

    :catchall_2e
    move-exception p1

    .line 411
    iput-boolean v1, p0, Landroidx/fragment/app/FragmentManager;->b:Z

    .line 412
    throw p1
.end method

.method public a(II)V
    .registers 5

    if-ltz p1, :cond_d

    .line 2
    new-instance v0, Landroidx/fragment/app/FragmentManager$o;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1, p1, p2}, Landroidx/fragment/app/FragmentManager$o;-><init>(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;II)V

    const/4 p1, 0x0

    invoke-virtual {p0, v0, p1}, Landroidx/fragment/app/FragmentManager;->a(Landroidx/fragment/app/FragmentManager$n;Z)V

    return-void

    .line 3
    :cond_d
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Bad id: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public a(IZ)V
    .registers 6

    .line 150
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    if-nez v0, :cond_10

    const/4 v0, -0x1

    if-ne p1, v0, :cond_8

    goto :goto_10

    .line 151
    :cond_8
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "No activity"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_10
    :goto_10
    if-nez p2, :cond_17

    .line 152
    iget p2, p0, Landroidx/fragment/app/FragmentManager;->q:I

    if-ne p1, p2, :cond_17

    return-void

    .line 153
    :cond_17
    iput p1, p0, Landroidx/fragment/app/FragmentManager;->q:I

    .line 154
    sget-boolean p1, Landroidx/fragment/app/FragmentManager;->P:Z

    const/4 p2, 0x0

    if-eqz p1, :cond_24

    .line 155
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {p1}, Lb/l/d/p;->f()V

    goto :goto_74

    .line 156
    :cond_24
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {p1}, Lb/l/d/p;->d()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3e

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/fragment/app/Fragment;

    .line 157
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->r(Landroidx/fragment/app/Fragment;)V

    goto :goto_2e

    .line 158
    :cond_3e
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {p1}, Lb/l/d/p;->b()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_48
    :goto_48
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_74

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/l/d/o;

    .line 159
    invoke-virtual {v0}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v1

    .line 160
    iget-boolean v2, v1, Landroidx/fragment/app/Fragment;->S:Z

    if-nez v2, :cond_5f

    .line 161
    invoke-virtual {p0, v1}, Landroidx/fragment/app/FragmentManager;->r(Landroidx/fragment/app/Fragment;)V

    .line 162
    :cond_5f
    iget-boolean v2, v1, Landroidx/fragment/app/Fragment;->t:Z

    if-eqz v2, :cond_6b

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->S()Z

    move-result v1

    if-nez v1, :cond_6b

    const/4 v1, 0x1

    goto :goto_6c

    :cond_6b
    const/4 v1, 0x0

    :goto_6c
    if-eqz v1, :cond_48

    .line 163
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v1, v0}, Lb/l/d/p;->b(Lb/l/d/o;)V

    goto :goto_48

    .line 164
    :cond_74
    :goto_74
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->P()V

    .line 165
    iget-boolean p1, p0, Landroidx/fragment/app/FragmentManager;->D:Z

    if-eqz p1, :cond_89

    iget-object p1, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    if-eqz p1, :cond_89

    iget v0, p0, Landroidx/fragment/app/FragmentManager;->q:I

    const/4 v1, 0x7

    if-ne v0, v1, :cond_89

    .line 166
    invoke-virtual {p1}, Lb/l/d/h;->l()V

    .line 167
    iput-boolean p2, p0, Landroidx/fragment/app/FragmentManager;->D:Z

    :cond_89
    return-void
.end method

.method public a(Landroid/content/res/Configuration;)V
    .registers 4

    .line 415
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v0}, Lb/l/d/p;->d()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    if-eqz v1, :cond_a

    .line 416
    invoke-virtual {v1, p1}, Landroidx/fragment/app/Fragment;->a(Landroid/content/res/Configuration;)V

    goto :goto_a

    :cond_1c
    return-void
.end method

.method public a(Landroid/os/Parcelable;)V
    .registers 13

    if-nez p1, :cond_3

    return-void

    .line 321
    :cond_3
    check-cast p1, Landroidx/fragment/app/FragmentManagerState;

    .line 322
    iget-object v0, p1, Landroidx/fragment/app/FragmentManagerState;->h:Ljava/util/ArrayList;

    if-nez v0, :cond_a

    return-void

    .line 323
    :cond_a
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v0}, Lb/l/d/p;->g()V

    .line 324
    iget-object v0, p1, Landroidx/fragment/app/FragmentManagerState;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_15
    :goto_15
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const-string v2, "): "

    const/4 v3, 0x2

    const-string v4, "FragmentManager"

    if-eqz v1, :cond_b0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Landroidx/fragment/app/FragmentState;

    if-eqz v10, :cond_15

    .line 325
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->M:Lb/l/d/l;

    iget-object v5, v10, Landroidx/fragment/app/FragmentState;->i:Ljava/lang/String;

    invoke-virtual {v1, v5}, Lb/l/d/l;->b(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    if-eqz v1, :cond_57

    .line 326
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v5

    if-eqz v5, :cond_4d

    .line 327
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "restoreSaveState: re-attaching retained "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    :cond_4d
    new-instance v5, Lb/l/d/o;

    iget-object v6, p0, Landroidx/fragment/app/FragmentManager;->o:Lb/l/d/j;

    iget-object v7, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-direct {v5, v6, v7, v1, v10}, Lb/l/d/o;-><init>(Lb/l/d/j;Lb/l/d/p;Landroidx/fragment/app/Fragment;Landroidx/fragment/app/FragmentState;)V

    goto :goto_6f

    .line 329
    :cond_57
    new-instance v1, Lb/l/d/o;

    iget-object v6, p0, Landroidx/fragment/app/FragmentManager;->o:Lb/l/d/j;

    iget-object v7, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    iget-object v5, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    .line 330
    invoke-virtual {v5}, Lb/l/d/h;->h()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v8

    .line 331
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->y()Lb/l/d/g;

    move-result-object v9

    move-object v5, v1

    invoke-direct/range {v5 .. v10}, Lb/l/d/o;-><init>(Lb/l/d/j;Lb/l/d/p;Ljava/lang/ClassLoader;Lb/l/d/g;Landroidx/fragment/app/FragmentState;)V

    .line 332
    :goto_6f
    invoke-virtual {v5}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v1

    .line 333
    iput-object p0, v1, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    .line 334
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v3

    if-eqz v3, :cond_97

    .line 335
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "restoreSaveState: active ("

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v1, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 336
    :cond_97
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    invoke-virtual {v1}, Lb/l/d/h;->h()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v5, v1}, Lb/l/d/o;->a(Ljava/lang/ClassLoader;)V

    .line 337
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v1, v5}, Lb/l/d/p;->a(Lb/l/d/o;)V

    .line 338
    iget v1, p0, Landroidx/fragment/app/FragmentManager;->q:I

    invoke-virtual {v5, v1}, Lb/l/d/o;->a(I)V

    goto/16 :goto_15

    .line 339
    :cond_b0
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->M:Lb/l/d/l;

    invoke-virtual {v0}, Lb/l/d/l;->c()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_ba
    :goto_ba
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_111

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    .line 340
    iget-object v5, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    iget-object v6, v1, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lb/l/d/p;->a(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_ba

    .line 341
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v5

    if-eqz v5, :cond_f4

    .line 342
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Discarding retained Fragment "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, " that was not found in the set of active Fragments "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p1, Landroidx/fragment/app/FragmentManagerState;->h:Ljava/util/ArrayList;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 343
    :cond_f4
    iget-object v5, p0, Landroidx/fragment/app/FragmentManager;->M:Lb/l/d/l;

    invoke-virtual {v5, v1}, Lb/l/d/l;->e(Landroidx/fragment/app/Fragment;)V

    .line 344
    iput-object p0, v1, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    .line 345
    new-instance v5, Lb/l/d/o;

    iget-object v6, p0, Landroidx/fragment/app/FragmentManager;->o:Lb/l/d/j;

    iget-object v7, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-direct {v5, v6, v7, v1}, Lb/l/d/o;-><init>(Lb/l/d/j;Lb/l/d/p;Landroidx/fragment/app/Fragment;)V

    const/4 v6, 0x1

    .line 346
    invoke-virtual {v5, v6}, Lb/l/d/o;->a(I)V

    .line 347
    invoke-virtual {v5}, Lb/l/d/o;->l()V

    .line 348
    iput-boolean v6, v1, Landroidx/fragment/app/Fragment;->t:Z

    .line 349
    invoke-virtual {v5}, Lb/l/d/o;->l()V

    goto :goto_ba

    .line 350
    :cond_111
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    iget-object v1, p1, Landroidx/fragment/app/FragmentManagerState;->i:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lb/l/d/p;->a(Ljava/util/List;)V

    .line 351
    iget-object v0, p1, Landroidx/fragment/app/FragmentManagerState;->j:[Landroidx/fragment/app/BackStackState;

    const/4 v1, 0x0

    if-eqz v0, :cond_177

    .line 352
    new-instance v0, Ljava/util/ArrayList;

    iget-object v5, p1, Landroidx/fragment/app/FragmentManagerState;->j:[Landroidx/fragment/app/BackStackState;

    array-length v5, v5

    invoke-direct {v0, v5}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->d:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 353
    :goto_128
    iget-object v5, p1, Landroidx/fragment/app/FragmentManagerState;->j:[Landroidx/fragment/app/BackStackState;

    array-length v6, v5

    if-ge v0, v6, :cond_17a

    .line 354
    aget-object v5, v5, v0

    invoke-virtual {v5, p0}, Landroidx/fragment/app/BackStackState;->a(Landroidx/fragment/app/FragmentManager;)Lb/l/d/a;

    move-result-object v5

    .line 355
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v6

    if-eqz v6, :cond_16f

    .line 356
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "restoreAllState: back stack #"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, " (index "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, v5, Lb/l/d/a;->s:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 357
    new-instance v6, Lb/l/d/v;

    invoke-direct {v6, v4}, Lb/l/d/v;-><init>(Ljava/lang/String;)V

    .line 358
    new-instance v7, Ljava/io/PrintWriter;

    invoke-direct {v7, v6}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    const-string v6, "  "

    .line 359
    invoke-virtual {v5, v6, v7, v1}, Lb/l/d/a;->a(Ljava/lang/String;Ljava/io/PrintWriter;Z)V

    .line 360
    invoke-virtual {v7}, Ljava/io/PrintWriter;->close()V

    .line 361
    :cond_16f
    iget-object v6, p0, Landroidx/fragment/app/FragmentManager;->d:Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_128

    :cond_177
    const/4 v0, 0x0

    .line 362
    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->d:Ljava/util/ArrayList;

    .line 363
    :cond_17a
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->i:Ljava/util/concurrent/atomic/AtomicInteger;

    iget v2, p1, Landroidx/fragment/app/FragmentManagerState;->k:I

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 364
    iget-object v0, p1, Landroidx/fragment/app/FragmentManagerState;->l:Ljava/lang/String;

    if-eqz v0, :cond_18e

    .line 365
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->b(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->u:Landroidx/fragment/app/Fragment;

    .line 366
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->i(Landroidx/fragment/app/Fragment;)V

    .line 367
    :cond_18e
    iget-object v0, p1, Landroidx/fragment/app/FragmentManagerState;->m:Ljava/util/ArrayList;

    if-eqz v0, :cond_1b9

    .line 368
    :goto_192
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1b9

    .line 369
    iget-object v2, p1, Landroidx/fragment/app/FragmentManagerState;->n:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Bundle;

    .line 370
    iget-object v3, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    invoke-virtual {v3}, Lb/l/d/h;->h()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 371
    iget-object v3, p0, Landroidx/fragment/app/FragmentManager;->j:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_192

    .line 372
    :cond_1b9
    new-instance v0, Ljava/util/ArrayDeque;

    iget-object p1, p1, Landroidx/fragment/app/FragmentManagerState;->o:Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayDeque;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->C:Ljava/util/ArrayDeque;

    return-void
.end method

.method public a(Landroid/view/Menu;)V
    .registers 4

    .line 431
    iget v0, p0, Landroidx/fragment/app/FragmentManager;->q:I

    const/4 v1, 0x1

    if-ge v0, v1, :cond_6

    return-void

    .line 432
    :cond_6
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v0}, Lb/l/d/p;->d()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_10
    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    if-eqz v1, :cond_10

    .line 433
    invoke-virtual {v1, p1}, Landroidx/fragment/app/Fragment;->c(Landroid/view/Menu;)V

    goto :goto_10

    :cond_22
    return-void
.end method

.method public a(Landroidx/fragment/app/Fragment;I)V
    .registers 13

    .line 97
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    iget-object v1, p1, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lb/l/d/p;->e(Ljava/lang/String;)Lb/l/d/o;

    move-result-object v0

    const/4 v1, 0x1

    if-nez v0, :cond_17

    .line 98
    new-instance v0, Lb/l/d/o;

    iget-object v2, p0, Landroidx/fragment/app/FragmentManager;->o:Lb/l/d/j;

    iget-object v3, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-direct {v0, v2, v3, p1}, Lb/l/d/o;-><init>(Lb/l/d/j;Lb/l/d/p;Landroidx/fragment/app/Fragment;)V

    .line 99
    invoke-virtual {v0, v1}, Lb/l/d/o;->a(I)V

    .line 100
    :cond_17
    iget-boolean v2, p1, Landroidx/fragment/app/Fragment;->u:Z

    const/4 v3, 0x2

    if-eqz v2, :cond_28

    iget-boolean v2, p1, Landroidx/fragment/app/Fragment;->v:Z

    if-eqz v2, :cond_28

    iget v2, p1, Landroidx/fragment/app/Fragment;->h:I

    if-ne v2, v3, :cond_28

    .line 101
    invoke-static {p2, v3}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 102
    :cond_28
    invoke-virtual {v0}, Lb/l/d/o;->d()I

    move-result v2

    invoke-static {p2, v2}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 103
    iget v2, p1, Landroidx/fragment/app/Fragment;->h:I

    const/4 v4, 0x3

    const-string v5, "FragmentManager"

    const/4 v6, -0x1

    const/4 v7, 0x5

    const/4 v8, 0x4

    if-gt v2, p2, :cond_7c

    if-ge v2, p2, :cond_47

    .line 104
    iget-object v2, p0, Landroidx/fragment/app/FragmentManager;->m:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_47

    .line 105
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->c(Landroidx/fragment/app/Fragment;)V

    .line 106
    :cond_47
    iget v2, p1, Landroidx/fragment/app/Fragment;->h:I

    if-eq v2, v6, :cond_57

    if-eqz v2, :cond_5c

    if-eq v2, v1, :cond_61

    if-eq v2, v3, :cond_6b

    if-eq v2, v8, :cond_70

    if-eq v2, v7, :cond_75

    goto/16 :goto_164

    :cond_57
    if-le p2, v6, :cond_5c

    .line 107
    invoke-virtual {v0}, Lb/l/d/o;->c()V

    :cond_5c
    if-lez p2, :cond_61

    .line 108
    invoke-virtual {v0}, Lb/l/d/o;->e()V

    :cond_61
    if-le p2, v6, :cond_66

    .line 109
    invoke-virtual {v0}, Lb/l/d/o;->j()V

    :cond_66
    if-le p2, v1, :cond_6b

    .line 110
    invoke-virtual {v0}, Lb/l/d/o;->f()V

    :cond_6b
    if-le p2, v3, :cond_70

    .line 111
    invoke-virtual {v0}, Lb/l/d/o;->a()V

    :cond_70
    if-le p2, v8, :cond_75

    .line 112
    invoke-virtual {v0}, Lb/l/d/o;->r()V

    :cond_75
    if-le p2, v7, :cond_164

    .line 113
    invoke-virtual {v0}, Lb/l/d/o;->n()V

    goto/16 :goto_164

    :cond_7c
    if-le v2, p2, :cond_164

    if-eqz v2, :cond_15d

    if-eq v2, v1, :cond_14f

    if-eq v2, v3, :cond_c6

    if-eq v2, v8, :cond_97

    if-eq v2, v7, :cond_92

    const/4 v9, 0x7

    if-eq v2, v9, :cond_8d

    goto/16 :goto_164

    :cond_8d
    if-ge p2, v9, :cond_92

    .line 114
    invoke-virtual {v0}, Lb/l/d/o;->m()V

    :cond_92
    if-ge p2, v7, :cond_97

    .line 115
    invoke-virtual {v0}, Lb/l/d/o;->s()V

    :cond_97
    if-ge p2, v8, :cond_c6

    .line 116
    invoke-static {v4}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v2

    if-eqz v2, :cond_b3

    .line 117
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "movefrom ACTIVITY_CREATED: "

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    :cond_b3
    iget-object v2, p1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v2, :cond_c6

    .line 119
    iget-object v2, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    invoke-virtual {v2, p1}, Lb/l/d/h;->a(Landroidx/fragment/app/Fragment;)Z

    move-result v2

    if-eqz v2, :cond_c6

    iget-object v2, p1, Landroidx/fragment/app/Fragment;->j:Landroid/util/SparseArray;

    if-nez v2, :cond_c6

    .line 120
    invoke-virtual {v0}, Lb/l/d/o;->q()V

    :cond_c6
    if-ge p2, v3, :cond_14f

    const/4 v2, 0x0

    .line 121
    iget-object v7, p1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v7, :cond_144

    iget-object v8, p1, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    if-eqz v8, :cond_144

    .line 122
    invoke-virtual {v8, v7}, Landroid/view/ViewGroup;->endViewTransition(Landroid/view/View;)V

    .line 123
    iget-object v7, p1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->clearAnimation()V

    .line 124
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->W()Z

    move-result v7

    if-nez v7, :cond_144

    .line 125
    iget v7, p0, Landroidx/fragment/app/FragmentManager;->q:I

    const/4 v8, 0x0

    if-le v7, v6, :cond_105

    iget-boolean v6, p0, Landroidx/fragment/app/FragmentManager;->G:Z

    if-nez v6, :cond_105

    iget-object v6, p1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    .line 126
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v6

    if-nez v6, :cond_105

    iget v6, p1, Landroidx/fragment/app/Fragment;->U:F

    cmpl-float v6, v6, v8

    if-ltz v6, :cond_105

    .line 127
    iget-object v2, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    invoke-virtual {v2}, Lb/l/d/h;->h()Landroid/content/Context;

    move-result-object v2

    const/4 v6, 0x0

    .line 128
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->B()Z

    move-result v7

    .line 129
    invoke-static {v2, p1, v6, v7}, Lb/l/d/d;->a(Landroid/content/Context;Landroidx/fragment/app/Fragment;ZZ)Lb/l/d/d$d;

    move-result-object v2

    .line 130
    :cond_105
    iput v8, p1, Landroidx/fragment/app/Fragment;->U:F

    .line 131
    iget-object v6, p1, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    .line 132
    iget-object v7, p1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v2, :cond_112

    .line 133
    iget-object v8, p0, Landroidx/fragment/app/FragmentManager;->n:Lb/l/d/r$g;

    invoke-static {p1, v2, v8}, Lb/l/d/d;->a(Landroidx/fragment/app/Fragment;Lb/l/d/d$d;Lb/l/d/r$g;)V

    .line 134
    :cond_112
    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 135
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v2

    if-eqz v2, :cond_13f

    .line 136
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Removing view "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " for fragment "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " from container "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    :cond_13f
    iget-object v2, p1, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    if-eq v6, v2, :cond_144

    return-void

    .line 138
    :cond_144
    iget-object v2, p0, Landroidx/fragment/app/FragmentManager;->m:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_14f

    .line 139
    invoke-virtual {v0}, Lb/l/d/o;->h()V

    :cond_14f
    if-ge p2, v1, :cond_15d

    .line 140
    iget-object v2, p0, Landroidx/fragment/app/FragmentManager;->m:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_15a

    goto :goto_15e

    .line 141
    :cond_15a
    invoke-virtual {v0}, Lb/l/d/o;->g()V

    :cond_15d
    move v1, p2

    :goto_15e
    if-gez v1, :cond_163

    .line 142
    invoke-virtual {v0}, Lb/l/d/o;->i()V

    :cond_163
    move p2, v1

    .line 143
    :cond_164
    :goto_164
    iget v0, p1, Landroidx/fragment/app/Fragment;->h:I

    if-eq v0, p2, :cond_196

    .line 144
    invoke-static {v4}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_194

    .line 145
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "moveToState: Fragment state for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " not updated inline; expected state "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " found "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p1, Landroidx/fragment/app/Fragment;->h:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    :cond_194
    iput p2, p1, Landroidx/fragment/app/Fragment;->h:I

    :cond_196
    return-void
.end method

.method public a(Landroidx/fragment/app/Fragment;Lb/h/i/b;)V
    .registers 5

    .line 17
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->m:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_12

    .line 18
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->m:Ljava/util/Map;

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    :cond_12
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->m:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/HashSet;

    invoke-virtual {p1, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public a(Landroidx/fragment/app/Fragment;Lb/n/e$c;)V
    .registers 5

    .line 434
    iget-object v0, p1, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->b(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/fragment/app/Fragment;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    iget-object v0, p1, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    if-eqz v0, :cond_14

    iget-object v0, p1, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    if-ne v0, p0, :cond_17

    .line 435
    :cond_14
    iput-object p2, p1, Landroidx/fragment/app/Fragment;->X:Lb/n/e$c;

    return-void

    .line 436
    :cond_17
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Fragment "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " is not an active fragment of FragmentManager "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public a(Landroidx/fragment/app/Fragment;Z)V
    .registers 4

    .line 147
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->k(Landroidx/fragment/app/Fragment;)Landroid/view/ViewGroup;

    move-result-object p1

    if-eqz p1, :cond_11

    .line 148
    instance-of v0, p1, Landroidx/fragment/app/FragmentContainerView;

    if-eqz v0, :cond_11

    .line 149
    check-cast p1, Landroidx/fragment/app/FragmentContainerView;

    xor-int/lit8 p2, p2, 0x1

    invoke-virtual {p1, p2}, Landroidx/fragment/app/FragmentContainerView;->setDrawDisappearingViewsLast(Z)V

    :cond_11
    return-void
.end method

.method public a(Landroidx/fragment/app/FragmentContainerView;)V
    .registers 7

    .line 24
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v0}, Lb/l/d/p;->b()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_32

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/o;

    .line 25
    invoke-virtual {v1}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v2

    .line 26
    iget v3, v2, Landroidx/fragment/app/Fragment;->E:I

    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getId()I

    move-result v4

    if-ne v3, v4, :cond_a

    iget-object v3, v2, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v3, :cond_a

    .line 27
    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    if-nez v3, :cond_a

    .line 28
    iput-object p1, v2, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    .line 29
    invoke-virtual {v1}, Lb/l/d/o;->b()V

    goto :goto_a

    :cond_32
    return-void
.end method

.method public a(Landroidx/fragment/app/FragmentManager$n;Z)V
    .registers 5

    if-nez p2, :cond_1d

    .line 179
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    if-nez v0, :cond_1a

    .line 180
    iget-boolean p1, p0, Landroidx/fragment/app/FragmentManager;->G:Z

    if-eqz p1, :cond_12

    .line 181
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "FragmentManager has been destroyed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 182
    :cond_12
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "FragmentManager has not been attached to a host."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 183
    :cond_1a
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->d()V

    .line 184
    :cond_1d
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->a:Ljava/util/ArrayList;

    monitor-enter v0

    .line 185
    :try_start_20
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    if-nez v1, :cond_30

    if-eqz p2, :cond_28

    .line 186
    monitor-exit v0

    return-void

    .line 187
    :cond_28
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Activity has been destroyed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 188
    :cond_30
    iget-object p2, p0, Landroidx/fragment/app/FragmentManager;->a:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 189
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->O()V

    .line 190
    monitor-exit v0

    return-void

    :catchall_3a
    move-exception p1

    monitor-exit v0
    :try_end_3c
    .catchall {:try_start_20 .. :try_end_3c} :catchall_3a

    throw p1
.end method

.method public final a(Lb/e/b;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/e/b<",
            "Landroidx/fragment/app/Fragment;",
            ">;)V"
        }
    .end annotation

    .line 297
    iget v0, p0, Landroidx/fragment/app/FragmentManager;->q:I

    const/4 v1, 0x1

    if-ge v0, v1, :cond_6

    return-void

    :cond_6
    const/4 v1, 0x5

    .line 298
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 299
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v1}, Lb/l/d/p;->d()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_15
    :goto_15
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_38

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/fragment/app/Fragment;

    .line 300
    iget v3, v2, Landroidx/fragment/app/Fragment;->h:I

    if-ge v3, v0, :cond_15

    .line 301
    invoke-virtual {p0, v2, v0}, Landroidx/fragment/app/FragmentManager;->a(Landroidx/fragment/app/Fragment;I)V

    .line 302
    iget-object v3, v2, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v3, :cond_15

    iget-boolean v3, v2, Landroidx/fragment/app/Fragment;->G:Z

    if-nez v3, :cond_15

    iget-boolean v3, v2, Landroidx/fragment/app/Fragment;->S:Z

    if-eqz v3, :cond_15

    .line 303
    invoke-virtual {p1, v2}, Lb/e/b;->add(Ljava/lang/Object;)Z

    goto :goto_15

    :cond_38
    return-void
.end method

.method public a(Lb/l/d/a;)V
    .registers 3

    .line 304
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->d:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 305
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->d:Ljava/util/ArrayList;

    .line 306
    :cond_b
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->d:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public a(Lb/l/d/a;ZZZ)V
    .registers 14

    if-eqz p2, :cond_6

    .line 280
    invoke-virtual {p1, p4}, Lb/l/d/a;->c(Z)V

    goto :goto_9

    .line 281
    :cond_6
    invoke-virtual {p1}, Lb/l/d/a;->f()V

    .line 282
    :goto_9
    new-instance v2, Ljava/util/ArrayList;

    const/4 v8, 0x1

    invoke-direct {v2, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 283
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 284
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 285
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {v3, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-eqz p3, :cond_34

    .line 286
    iget p2, p0, Landroidx/fragment/app/FragmentManager;->q:I

    if-lt p2, v8, :cond_34

    .line 287
    iget-object p2, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    invoke-virtual {p2}, Lb/l/d/h;->h()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->s:Lb/l/d/e;

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x1

    iget-object v7, p0, Landroidx/fragment/app/FragmentManager;->n:Lb/l/d/r$g;

    invoke-static/range {v0 .. v7}, Lb/l/d/r;->a(Landroid/content/Context;Lb/l/d/e;Ljava/util/ArrayList;Ljava/util/ArrayList;IIZLb/l/d/r$g;)V

    :cond_34
    if-eqz p4, :cond_3b

    .line 288
    iget p2, p0, Landroidx/fragment/app/FragmentManager;->q:I

    invoke-virtual {p0, p2, v8}, Landroidx/fragment/app/FragmentManager;->a(IZ)V

    .line 289
    :cond_3b
    iget-object p2, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {p2}, Lb/l/d/p;->c()Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_45
    :goto_45
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_7c

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroidx/fragment/app/Fragment;

    if-eqz p3, :cond_45

    .line 290
    iget-object v0, p3, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v0, :cond_45

    iget-boolean v0, p3, Landroidx/fragment/app/Fragment;->S:Z

    if-eqz v0, :cond_45

    iget v0, p3, Landroidx/fragment/app/Fragment;->E:I

    .line 291
    invoke-virtual {p1, v0}, Lb/l/d/a;->b(I)Z

    move-result v0

    if-eqz v0, :cond_45

    .line 292
    iget v0, p3, Landroidx/fragment/app/Fragment;->U:F

    const/4 v1, 0x0

    cmpl-float v2, v0, v1

    if-lez v2, :cond_6f

    .line 293
    iget-object v2, p3, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setAlpha(F)V

    :cond_6f
    if-eqz p4, :cond_74

    .line 294
    iput v1, p3, Landroidx/fragment/app/Fragment;->U:F

    goto :goto_45

    :cond_74
    const/high16 v0, -0x40800000    # -1.0f

    .line 295
    iput v0, p3, Landroidx/fragment/app/Fragment;->U:F

    const/4 v0, 0x0

    .line 296
    iput-boolean v0, p3, Landroidx/fragment/app/Fragment;->S:Z

    goto :goto_45

    :cond_7c
    return-void
.end method

.method public a(Lb/l/d/h;Lb/l/d/e;Landroidx/fragment/app/Fragment;)V
    .registers 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SyntheticAccessor"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/l/d/h<",
            "*>;",
            "Lb/l/d/e;",
            "Landroidx/fragment/app/Fragment;",
            ")V"
        }
    .end annotation

    .line 373
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    if-nez v0, :cond_10a

    .line 374
    iput-object p1, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    .line 375
    iput-object p2, p0, Landroidx/fragment/app/FragmentManager;->s:Lb/l/d/e;

    .line 376
    iput-object p3, p0, Landroidx/fragment/app/FragmentManager;->t:Landroidx/fragment/app/Fragment;

    if-eqz p3, :cond_15

    .line 377
    new-instance p2, Landroidx/fragment/app/FragmentManager$i;

    invoke-direct {p2, p0, p3}, Landroidx/fragment/app/FragmentManager$i;-><init>(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;)V

    invoke-virtual {p0, p2}, Landroidx/fragment/app/FragmentManager;->a(Lb/l/d/m;)V

    goto :goto_1f

    .line 378
    :cond_15
    instance-of p2, p1, Lb/l/d/m;

    if-eqz p2, :cond_1f

    .line 379
    move-object p2, p1

    check-cast p2, Lb/l/d/m;

    invoke-virtual {p0, p2}, Landroidx/fragment/app/FragmentManager;->a(Lb/l/d/m;)V

    .line 380
    :cond_1f
    :goto_1f
    iget-object p2, p0, Landroidx/fragment/app/FragmentManager;->t:Landroidx/fragment/app/Fragment;

    if-eqz p2, :cond_26

    .line 381
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->Q()V

    .line 382
    :cond_26
    instance-of p2, p1, Lb/a/c;

    if-eqz p2, :cond_3d

    .line 383
    move-object p2, p1

    check-cast p2, Lb/a/c;

    .line 384
    invoke-interface {p2}, Lb/a/c;->b()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object v0

    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->g:Landroidx/activity/OnBackPressedDispatcher;

    if-eqz p3, :cond_36

    move-object p2, p3

    .line 385
    :cond_36
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->g:Landroidx/activity/OnBackPressedDispatcher;

    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->h:Lb/a/b;

    invoke-virtual {v0, p2, v1}, Landroidx/activity/OnBackPressedDispatcher;->a(Lb/n/h;Lb/a/b;)V

    :cond_3d
    if-eqz p3, :cond_48

    .line 386
    iget-object p1, p3, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p1, p3}, Landroidx/fragment/app/FragmentManager;->j(Landroidx/fragment/app/Fragment;)Lb/l/d/l;

    move-result-object p1

    iput-object p1, p0, Landroidx/fragment/app/FragmentManager;->M:Lb/l/d/l;

    goto :goto_61

    .line 387
    :cond_48
    instance-of p2, p1, Lb/n/t;

    if-eqz p2, :cond_59

    .line 388
    check-cast p1, Lb/n/t;

    invoke-interface {p1}, Lb/n/t;->g()Lb/n/s;

    move-result-object p1

    .line 389
    invoke-static {p1}, Lb/l/d/l;->a(Lb/n/s;)Lb/l/d/l;

    move-result-object p1

    iput-object p1, p0, Landroidx/fragment/app/FragmentManager;->M:Lb/l/d/l;

    goto :goto_61

    .line 390
    :cond_59
    new-instance p1, Lb/l/d/l;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lb/l/d/l;-><init>(Z)V

    iput-object p1, p0, Landroidx/fragment/app/FragmentManager;->M:Lb/l/d/l;

    .line 391
    :goto_61
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager;->M:Lb/l/d/l;

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->J()Z

    move-result p2

    invoke-virtual {p1, p2}, Lb/l/d/l;->a(Z)V

    .line 392
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    iget-object p2, p0, Landroidx/fragment/app/FragmentManager;->M:Lb/l/d/l;

    invoke-virtual {p1, p2}, Lb/l/d/p;->a(Lb/l/d/l;)V

    .line 393
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    instance-of p2, p1, Lb/a/e/d;

    if-eqz p2, :cond_109

    .line 394
    check-cast p1, Lb/a/e/d;

    .line 395
    invoke-interface {p1}, Lb/a/e/d;->d()Lb/a/e/c;

    move-result-object p1

    if-eqz p3, :cond_93

    .line 396
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p3, p3, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ":"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_95

    :cond_93
    const-string p2, ""

    .line 397
    :goto_95
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "FragmentManager:"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 398
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "StartActivityForResult"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    new-instance v0, Lb/a/e/e/c;

    invoke-direct {v0}, Lb/a/e/e/c;-><init>()V

    new-instance v1, Landroidx/fragment/app/FragmentManager$j;

    invoke-direct {v1, p0}, Landroidx/fragment/app/FragmentManager$j;-><init>(Landroidx/fragment/app/FragmentManager;)V

    invoke-virtual {p1, p3, v0, v1}, Lb/a/e/c;->a(Ljava/lang/String;Lb/a/e/e/a;Lb/a/e/a;)Lb/a/e/b;

    move-result-object p3

    iput-object p3, p0, Landroidx/fragment/app/FragmentManager;->z:Lb/a/e/b;

    .line 399
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "StartIntentSenderForResult"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    new-instance v0, Landroidx/fragment/app/FragmentManager$k;

    invoke-direct {v0}, Landroidx/fragment/app/FragmentManager$k;-><init>()V

    new-instance v1, Landroidx/fragment/app/FragmentManager$a;

    invoke-direct {v1, p0}, Landroidx/fragment/app/FragmentManager$a;-><init>(Landroidx/fragment/app/FragmentManager;)V

    invoke-virtual {p1, p3, v0, v1}, Lb/a/e/c;->a(Ljava/lang/String;Lb/a/e/e/a;Lb/a/e/a;)Lb/a/e/b;

    move-result-object p3

    iput-object p3, p0, Landroidx/fragment/app/FragmentManager;->A:Lb/a/e/b;

    .line 400
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "RequestPermissions"

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    new-instance p3, Lb/a/e/e/b;

    invoke-direct {p3}, Lb/a/e/e/b;-><init>()V

    new-instance v0, Landroidx/fragment/app/FragmentManager$b;

    invoke-direct {v0, p0}, Landroidx/fragment/app/FragmentManager$b;-><init>(Landroidx/fragment/app/FragmentManager;)V

    invoke-virtual {p1, p2, p3, v0}, Lb/a/e/c;->a(Ljava/lang/String;Lb/a/e/e/a;Lb/a/e/a;)Lb/a/e/b;

    move-result-object p1

    iput-object p1, p0, Landroidx/fragment/app/FragmentManager;->B:Lb/a/e/b;

    :cond_109
    return-void

    .line 401
    :cond_10a
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Already attached"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(Lb/l/d/m;)V
    .registers 3

    .line 437
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->p:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public a(Lb/l/d/o;)V
    .registers 4

    .line 89
    invoke-virtual {p1}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v0

    .line 90
    iget-boolean v1, v0, Landroidx/fragment/app/Fragment;->P:Z

    if-eqz v1, :cond_1e

    .line 91
    iget-boolean v1, p0, Landroidx/fragment/app/FragmentManager;->b:Z

    if-eqz v1, :cond_10

    const/4 p1, 0x1

    .line 92
    iput-boolean p1, p0, Landroidx/fragment/app/FragmentManager;->H:Z

    return-void

    :cond_10
    const/4 v1, 0x0

    .line 93
    iput-boolean v1, v0, Landroidx/fragment/app/Fragment;->P:Z

    .line 94
    sget-boolean v1, Landroidx/fragment/app/FragmentManager;->P:Z

    if-eqz v1, :cond_1b

    .line 95
    invoke-virtual {p1}, Lb/l/d/o;->l()V

    goto :goto_1e

    .line 96
    :cond_1b
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->s(Landroidx/fragment/app/Fragment;)V

    :cond_1e
    :goto_1e
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .registers 3

    .line 20
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->j:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public a(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 9

    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "    "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 31
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v1, p1, p2, p3, p4}, Lb/l/d/p;->a(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 32
    iget-object p2, p0, Landroidx/fragment/app/FragmentManager;->e:Ljava/util/ArrayList;

    const/4 p4, 0x0

    if-eqz p2, :cond_4e

    .line 33
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-lez p2, :cond_4e

    .line 34
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v1, "Fragments Created Menus:"

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const/4 v1, 0x0

    :goto_2a
    if-ge v1, p2, :cond_4e

    .line 35
    iget-object v2, p0, Landroidx/fragment/app/FragmentManager;->e:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/fragment/app/Fragment;

    .line 36
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v3, "  #"

    .line 37
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 38
    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(I)V

    const-string v3, ": "

    .line 39
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 40
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_2a

    .line 41
    :cond_4e
    iget-object p2, p0, Landroidx/fragment/app/FragmentManager;->d:Ljava/util/ArrayList;

    if-eqz p2, :cond_88

    .line 42
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-lez p2, :cond_88

    .line 43
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v1, "Back Stack:"

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    const/4 v1, 0x0

    :goto_61
    if-ge v1, p2, :cond_88

    .line 44
    iget-object v2, p0, Landroidx/fragment/app/FragmentManager;->d:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/l/d/a;

    .line 45
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v3, "  #"

    .line 46
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 47
    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(I)V

    const-string v3, ": "

    .line 48
    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 49
    invoke-virtual {v2}, Lb/l/d/a;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 50
    invoke-virtual {v2, v0, p3}, Lb/l/d/a;->a(Ljava/lang/String;Ljava/io/PrintWriter;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_61

    .line 51
    :cond_88
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 52
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Back Stack Index: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->i:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 53
    iget-object p2, p0, Landroidx/fragment/app/FragmentManager;->a:Ljava/util/ArrayList;

    monitor-enter p2

    .line 54
    :try_start_a8
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_d8

    .line 55
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v1, "Pending Actions:"

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    :goto_b8
    if-ge p4, v0, :cond_d8

    .line 56
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/FragmentManager$n;

    .line 57
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v2, "  #"

    .line 58
    invoke-virtual {p3, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 59
    invoke-virtual {p3, p4}, Ljava/io/PrintWriter;->print(I)V

    const-string v2, ": "

    .line 60
    invoke-virtual {p3, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 61
    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    add-int/lit8 p4, p4, 0x1

    goto :goto_b8

    .line 62
    :cond_d8
    monitor-exit p2
    :try_end_d9
    .catchall {:try_start_a8 .. :try_end_d9} :catchall_149

    .line 63
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p2, "FragmentManager misc state:"

    .line 64
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 65
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p2, "  mHost="

    .line 66
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 67
    iget-object p2, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 68
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p2, "  mContainer="

    .line 69
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 70
    iget-object p2, p0, Landroidx/fragment/app/FragmentManager;->s:Lb/l/d/e;

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 71
    iget-object p2, p0, Landroidx/fragment/app/FragmentManager;->t:Landroidx/fragment/app/Fragment;

    if-eqz p2, :cond_10c

    .line 72
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p2, "  mParent="

    .line 73
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 74
    iget-object p2, p0, Landroidx/fragment/app/FragmentManager;->t:Landroidx/fragment/app/Fragment;

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 75
    :cond_10c
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p2, "  mCurState="

    .line 76
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 77
    iget p2, p0, Landroidx/fragment/app/FragmentManager;->q:I

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(I)V

    const-string p2, " mStateSaved="

    .line 78
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 79
    iget-boolean p2, p0, Landroidx/fragment/app/FragmentManager;->E:Z

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Z)V

    const-string p2, " mStopped="

    .line 80
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 81
    iget-boolean p2, p0, Landroidx/fragment/app/FragmentManager;->F:Z

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Z)V

    const-string p2, " mDestroyed="

    .line 82
    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 83
    iget-boolean p2, p0, Landroidx/fragment/app/FragmentManager;->G:Z

    invoke-virtual {p3, p2}, Ljava/io/PrintWriter;->println(Z)V

    .line 84
    iget-boolean p2, p0, Landroidx/fragment/app/FragmentManager;->D:Z

    if-eqz p2, :cond_148

    .line 85
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string p1, "  mNeedMenuInvalidate="

    .line 86
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 87
    iget-boolean p1, p0, Landroidx/fragment/app/FragmentManager;->D:Z

    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->println(Z)V

    :cond_148
    return-void

    :catchall_149
    move-exception p1

    .line 88
    :try_start_14a
    monitor-exit p2
    :try_end_14b
    .catchall {:try_start_14a .. :try_end_14b} :catchall_149

    throw p1
.end method

.method public final a(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lb/l/d/a;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 192
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->L:Ljava/util/ArrayList;

    const/4 v1, 0x0

    if-nez v0, :cond_7

    const/4 v0, 0x0

    goto :goto_b

    :cond_7
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_b
    const/4 v2, 0x0

    :goto_c
    if-ge v2, v0, :cond_83

    .line 193
    iget-object v3, p0, Landroidx/fragment/app/FragmentManager;->L:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/fragment/app/FragmentManager$p;

    const/4 v4, -0x1

    if-eqz p1, :cond_40

    .line 194
    iget-boolean v5, v3, Landroidx/fragment/app/FragmentManager$p;->a:Z

    if-nez v5, :cond_40

    .line 195
    iget-object v5, v3, Landroidx/fragment/app/FragmentManager$p;->b:Lb/l/d/a;

    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v5

    if-eq v5, v4, :cond_40

    if-eqz p2, :cond_40

    .line 196
    invoke-virtual {p2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_40

    .line 197
    iget-object v4, p0, Landroidx/fragment/app/FragmentManager;->L:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    add-int/lit8 v2, v2, -0x1

    add-int/lit8 v0, v0, -0x1

    .line 198
    invoke-virtual {v3}, Landroidx/fragment/app/FragmentManager$p;->c()V

    goto :goto_80

    .line 199
    :cond_40
    invoke-virtual {v3}, Landroidx/fragment/app/FragmentManager$p;->e()Z

    move-result v5

    if-nez v5, :cond_54

    if-eqz p1, :cond_80

    iget-object v5, v3, Landroidx/fragment/app/FragmentManager$p;->b:Lb/l/d/a;

    .line 200
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-virtual {v5, p1, v1, v6}, Lb/l/d/a;->a(Ljava/util/ArrayList;II)Z

    move-result v5

    if-eqz v5, :cond_80

    .line 201
    :cond_54
    iget-object v5, p0, Landroidx/fragment/app/FragmentManager;->L:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    add-int/lit8 v2, v2, -0x1

    add-int/lit8 v0, v0, -0x1

    if-eqz p1, :cond_7d

    .line 202
    iget-boolean v5, v3, Landroidx/fragment/app/FragmentManager$p;->a:Z

    if-nez v5, :cond_7d

    iget-object v5, v3, Landroidx/fragment/app/FragmentManager$p;->b:Lb/l/d/a;

    .line 203
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v5

    if-eq v5, v4, :cond_7d

    if-eqz p2, :cond_7d

    .line 204
    invoke-virtual {p2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_7d

    .line 205
    invoke-virtual {v3}, Landroidx/fragment/app/FragmentManager$p;->c()V

    goto :goto_80

    .line 206
    :cond_7d
    invoke-virtual {v3}, Landroidx/fragment/app/FragmentManager$p;->d()V

    :cond_80
    :goto_80
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    :cond_83
    return-void
.end method

.method public final a(Ljava/util/ArrayList;Ljava/util/ArrayList;II)V
    .registers 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lb/l/d/a;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Boolean;",
            ">;II)V"
        }
    .end annotation

    move-object/from16 v6, p0

    move-object/from16 v15, p1

    move-object/from16 v5, p2

    move/from16 v4, p3

    move/from16 v3, p4

    .line 207
    invoke-virtual {v15, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/l/d/a;

    iget-boolean v2, v0, Lb/l/d/q;->o:Z

    .line 208
    iget-object v0, v6, Landroidx/fragment/app/FragmentManager;->K:Ljava/util/ArrayList;

    if-nez v0, :cond_1e

    .line 209
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, v6, Landroidx/fragment/app/FragmentManager;->K:Ljava/util/ArrayList;

    goto :goto_21

    .line 210
    :cond_1e
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 211
    :goto_21
    iget-object v0, v6, Landroidx/fragment/app/FragmentManager;->K:Ljava/util/ArrayList;

    iget-object v1, v6, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v1}, Lb/l/d/p;->d()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 212
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/FragmentManager;->F()Landroidx/fragment/app/Fragment;

    move-result-object v0

    const/4 v1, 0x0

    move v7, v4

    const/16 v16, 0x0

    :goto_34
    const/4 v14, 0x1

    if-ge v7, v3, :cond_65

    .line 213
    invoke-virtual {v15, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lb/l/d/a;

    .line 214
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    if-nez v9, :cond_50

    .line 215
    iget-object v9, v6, Landroidx/fragment/app/FragmentManager;->K:Ljava/util/ArrayList;

    invoke-virtual {v8, v9, v0}, Lb/l/d/a;->a(Ljava/util/ArrayList;Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    goto :goto_56

    .line 216
    :cond_50
    iget-object v9, v6, Landroidx/fragment/app/FragmentManager;->K:Ljava/util/ArrayList;

    invoke-virtual {v8, v9, v0}, Lb/l/d/a;->b(Ljava/util/ArrayList;Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    :goto_56
    if-nez v16, :cond_60

    .line 217
    iget-boolean v8, v8, Lb/l/d/q;->g:Z

    if-eqz v8, :cond_5d

    goto :goto_60

    :cond_5d
    const/16 v16, 0x0

    goto :goto_62

    :cond_60
    :goto_60
    const/16 v16, 0x1

    :goto_62
    add-int/lit8 v7, v7, 0x1

    goto :goto_34

    .line 218
    :cond_65
    iget-object v0, v6, Landroidx/fragment/app/FragmentManager;->K:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    if-nez v2, :cond_bd

    .line 219
    iget v0, v6, Landroidx/fragment/app/FragmentManager;->q:I

    if-lt v0, v14, :cond_bd

    .line 220
    sget-boolean v0, Landroidx/fragment/app/FragmentManager;->P:Z

    if-eqz v0, :cond_a4

    move v0, v4

    :goto_75
    if-ge v0, v3, :cond_bd

    .line 221
    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/a;

    .line 222
    iget-object v1, v1, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_83
    :goto_83
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_a1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lb/l/d/q$a;

    .line 223
    iget-object v7, v7, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    if-eqz v7, :cond_83

    .line 224
    iget-object v8, v7, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    if-eqz v8, :cond_83

    .line 225
    invoke-virtual {v6, v7}, Landroidx/fragment/app/FragmentManager;->e(Landroidx/fragment/app/Fragment;)Lb/l/d/o;

    move-result-object v7

    .line 226
    iget-object v8, v6, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v8, v7}, Lb/l/d/p;->a(Lb/l/d/o;)V

    goto :goto_83

    :cond_a1
    add-int/lit8 v0, v0, 0x1

    goto :goto_75

    .line 227
    :cond_a4
    iget-object v0, v6, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    invoke-virtual {v0}, Lb/l/d/h;->h()Landroid/content/Context;

    move-result-object v7

    iget-object v8, v6, Landroidx/fragment/app/FragmentManager;->s:Lb/l/d/e;

    const/4 v13, 0x0

    iget-object v0, v6, Landroidx/fragment/app/FragmentManager;->n:Lb/l/d/r$g;

    move-object/from16 v9, p1

    move-object/from16 v10, p2

    move/from16 v11, p3

    move/from16 v12, p4

    const/4 v1, 0x1

    move-object v14, v0

    invoke-static/range {v7 .. v14}, Lb/l/d/r;->a(Landroid/content/Context;Lb/l/d/e;Ljava/util/ArrayList;Ljava/util/ArrayList;IIZLb/l/d/r$g;)V

    goto :goto_be

    :cond_bd
    const/4 v1, 0x1

    .line 228
    :goto_be
    invoke-static/range {p1 .. p4}, Landroidx/fragment/app/FragmentManager;->b(Ljava/util/ArrayList;Ljava/util/ArrayList;II)V

    .line 229
    sget-boolean v0, Landroidx/fragment/app/FragmentManager;->P:Z

    if-eqz v0, :cond_143

    add-int/lit8 v0, v3, -0x1

    .line 230
    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    move v2, v4

    :goto_d2
    if-ge v2, v3, :cond_11c

    .line 231
    invoke-virtual {v15, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lb/l/d/a;

    if-eqz v0, :cond_fb

    .line 232
    iget-object v8, v7, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    sub-int/2addr v8, v1

    :goto_e3
    if-ltz v8, :cond_119

    .line 233
    iget-object v9, v7, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lb/l/d/q$a;

    .line 234
    iget-object v9, v9, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    if-eqz v9, :cond_f8

    .line 235
    invoke-virtual {v6, v9}, Landroidx/fragment/app/FragmentManager;->e(Landroidx/fragment/app/Fragment;)Lb/l/d/o;

    move-result-object v9

    .line 236
    invoke-virtual {v9}, Lb/l/d/o;->l()V

    :cond_f8
    add-int/lit8 v8, v8, -0x1

    goto :goto_e3

    .line 237
    :cond_fb
    iget-object v7, v7, Lb/l/d/q;->a:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_101
    :goto_101
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_119

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lb/l/d/q$a;

    .line 238
    iget-object v8, v8, Lb/l/d/q$a;->b:Landroidx/fragment/app/Fragment;

    if-eqz v8, :cond_101

    .line 239
    invoke-virtual {v6, v8}, Landroidx/fragment/app/FragmentManager;->e(Landroidx/fragment/app/Fragment;)Lb/l/d/o;

    move-result-object v8

    .line 240
    invoke-virtual {v8}, Lb/l/d/o;->l()V

    goto :goto_101

    :cond_119
    add-int/lit8 v2, v2, 0x1

    goto :goto_d2

    .line 241
    :cond_11c
    iget v2, v6, Landroidx/fragment/app/FragmentManager;->q:I

    invoke-virtual {v6, v2, v1}, Landroidx/fragment/app/FragmentManager;->a(IZ)V

    .line 242
    invoke-virtual {v6, v15, v4, v3}, Landroidx/fragment/app/FragmentManager;->a(Ljava/util/ArrayList;II)Ljava/util/Set;

    move-result-object v1

    .line 243
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_129
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_13f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/l/d/w;

    .line 244
    invoke-virtual {v2, v0}, Lb/l/d/w;->a(Z)V

    .line 245
    invoke-virtual {v2}, Lb/l/d/w;->e()V

    .line 246
    invoke-virtual {v2}, Lb/l/d/w;->a()V

    goto :goto_129

    :cond_13f
    move v0, v3

    move-object v3, v5

    goto/16 :goto_199

    :cond_143
    if-eqz v2, :cond_165

    .line 247
    new-instance v7, Lb/e/b;

    invoke-direct {v7}, Lb/e/b;-><init>()V

    .line 248
    invoke-virtual {v6, v7}, Landroidx/fragment/app/FragmentManager;->a(Lb/e/b;)V

    move-object/from16 v0, p0

    const/4 v14, 0x1

    move-object/from16 v1, p1

    move v8, v2

    move-object/from16 v2, p2

    move v13, v3

    move/from16 v3, p3

    move v12, v4

    move/from16 v4, p4

    move-object v11, v5

    move-object v5, v7

    .line 249
    invoke-virtual/range {v0 .. v5}, Landroidx/fragment/app/FragmentManager;->a(Ljava/util/ArrayList;Ljava/util/ArrayList;IILb/e/b;)I

    move-result v0

    .line 250
    invoke-virtual {v6, v7}, Landroidx/fragment/app/FragmentManager;->b(Lb/e/b;)V

    goto :goto_16b

    :cond_165
    move v8, v2

    move v13, v3

    move v12, v4

    move-object v11, v5

    const/4 v14, 0x1

    move v0, v13

    :goto_16b
    if-eq v0, v12, :cond_197

    if-eqz v8, :cond_197

    .line 251
    iget v1, v6, Landroidx/fragment/app/FragmentManager;->q:I

    if-lt v1, v14, :cond_18e

    .line 252
    iget-object v1, v6, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    invoke-virtual {v1}, Lb/l/d/h;->h()Landroid/content/Context;

    move-result-object v7

    iget-object v8, v6, Landroidx/fragment/app/FragmentManager;->s:Lb/l/d/e;

    const/4 v1, 0x1

    iget-object v2, v6, Landroidx/fragment/app/FragmentManager;->n:Lb/l/d/r$g;

    move-object/from16 v9, p1

    move-object/from16 v10, p2

    move-object v3, v11

    move/from16 v11, p3

    move v12, v0

    move v0, v13

    move v13, v1

    const/4 v1, 0x1

    move-object v14, v2

    invoke-static/range {v7 .. v14}, Lb/l/d/r;->a(Landroid/content/Context;Lb/l/d/e;Ljava/util/ArrayList;Ljava/util/ArrayList;IIZLb/l/d/r$g;)V

    goto :goto_191

    :cond_18e
    move-object v3, v11

    move v0, v13

    const/4 v1, 0x1

    .line 253
    :goto_191
    iget v2, v6, Landroidx/fragment/app/FragmentManager;->q:I

    invoke-virtual {v6, v2, v1}, Landroidx/fragment/app/FragmentManager;->a(IZ)V

    goto :goto_199

    :cond_197
    move-object v3, v11

    move v0, v13

    :goto_199
    move/from16 v1, p3

    :goto_19b
    if-ge v1, v0, :cond_1bc

    .line 254
    invoke-virtual {v15, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/l/d/a;

    .line 255
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_1b6

    .line 256
    iget v4, v2, Lb/l/d/a;->s:I

    if-ltz v4, :cond_1b6

    const/4 v4, -0x1

    .line 257
    iput v4, v2, Lb/l/d/a;->s:I

    .line 258
    :cond_1b6
    invoke-virtual {v2}, Lb/l/d/a;->i()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_19b

    :cond_1bc
    if-eqz v16, :cond_1c1

    .line 259
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/FragmentManager;->M()V

    :cond_1c1
    return-void
.end method

.method public a(Z)V
    .registers 4

    .line 413
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v0}, Lb/l/d/p;->d()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    if-eqz v1, :cond_a

    .line 414
    invoke-virtual {v1, p1}, Landroidx/fragment/app/Fragment;->f(Z)V

    goto :goto_a

    :cond_1c
    return-void
.end method

.method public a(Landroid/view/Menu;Landroid/view/MenuInflater;)Z
    .registers 10

    .line 417
    iget v0, p0, Landroidx/fragment/app/FragmentManager;->q:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ge v0, v2, :cond_7

    return v1

    :cond_7
    const/4 v0, 0x0

    .line 418
    iget-object v3, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v3}, Lb/l/d/p;->d()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v4, 0x0

    :cond_13
    :goto_13
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_39

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/fragment/app/Fragment;

    if-eqz v5, :cond_13

    .line 419
    invoke-virtual {p0, v5}, Landroidx/fragment/app/FragmentManager;->p(Landroidx/fragment/app/Fragment;)Z

    move-result v6

    if-eqz v6, :cond_13

    invoke-virtual {v5, p1, p2}, Landroidx/fragment/app/Fragment;->b(Landroid/view/Menu;Landroid/view/MenuInflater;)Z

    move-result v6

    if-eqz v6, :cond_13

    if-nez v0, :cond_34

    .line 420
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 421
    :cond_34
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v4, 0x1

    goto :goto_13

    .line 422
    :cond_39
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager;->e:Ljava/util/ArrayList;

    if-eqz p1, :cond_5b

    .line 423
    :goto_3d
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager;->e:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ge v1, p1, :cond_5b

    .line 424
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager;->e:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/fragment/app/Fragment;

    if-eqz v0, :cond_55

    .line 425
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_58

    .line 426
    :cond_55
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->a0()V

    :cond_58
    add-int/lit8 v1, v1, 0x1

    goto :goto_3d

    .line 427
    :cond_5b
    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->e:Ljava/util/ArrayList;

    return v4
.end method

.method public a(Landroid/view/MenuItem;)Z
    .registers 6

    .line 428
    iget v0, p0, Landroidx/fragment/app/FragmentManager;->q:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ge v0, v2, :cond_7

    return v1

    .line 429
    :cond_7
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v0}, Lb/l/d/p;->d()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_26

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/fragment/app/Fragment;

    if-eqz v3, :cond_11

    .line 430
    invoke-virtual {v3, p1}, Landroidx/fragment/app/Fragment;->c(Landroid/view/MenuItem;)Z

    move-result v3

    if-eqz v3, :cond_11

    return v2

    :cond_26
    return v1
.end method

.method public final a(Ljava/lang/String;II)Z
    .registers 12

    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->d(Z)Z

    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->c(Z)V

    .line 6
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->u:Landroidx/fragment/app/Fragment;

    if-eqz v1, :cond_1b

    if-gez p2, :cond_1b

    if-nez p1, :cond_1b

    .line 7
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->o()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    .line 8
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->L()Z

    move-result v1

    if-eqz v1, :cond_1b

    return v0

    .line 9
    :cond_1b
    iget-object v3, p0, Landroidx/fragment/app/FragmentManager;->I:Ljava/util/ArrayList;

    iget-object v4, p0, Landroidx/fragment/app/FragmentManager;->J:Ljava/util/ArrayList;

    move-object v2, p0

    move-object v5, p1

    move v6, p2

    move v7, p3

    invoke-virtual/range {v2 .. v7}, Landroidx/fragment/app/FragmentManager;->a(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;II)Z

    move-result p1

    if-eqz p1, :cond_3b

    .line 10
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->b:Z

    .line 11
    :try_start_2b
    iget-object p2, p0, Landroidx/fragment/app/FragmentManager;->I:Ljava/util/ArrayList;

    iget-object p3, p0, Landroidx/fragment/app/FragmentManager;->J:Ljava/util/ArrayList;

    invoke-virtual {p0, p2, p3}, Landroidx/fragment/app/FragmentManager;->c(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    :try_end_32
    .catchall {:try_start_2b .. :try_end_32} :catchall_36

    .line 12
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->e()V

    goto :goto_3b

    :catchall_36
    move-exception p1

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->e()V

    .line 13
    throw p1

    .line 14
    :cond_3b
    :goto_3b
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->Q()V

    .line 15
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->s()V

    .line 16
    iget-object p2, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {p2}, Lb/l/d/p;->a()V

    return p1
.end method

.method public a(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;II)Z
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lb/l/d/a;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/String;",
            "II)Z"
        }
    .end annotation

    .line 307
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->d:Ljava/util/ArrayList;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    const/4 v2, 0x1

    if-nez p3, :cond_29

    if-gez p4, :cond_29

    and-int/lit8 v3, p5, 0x1

    if-nez v3, :cond_29

    .line 308
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p3

    sub-int/2addr p3, v2

    if-gez p3, :cond_17

    return v1

    .line 309
    :cond_17
    iget-object p4, p0, Landroidx/fragment/app/FragmentManager;->d:Ljava/util/ArrayList;

    invoke-virtual {p4, p3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 310
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_a4

    :cond_29
    if-nez p3, :cond_30

    if-ltz p4, :cond_2e

    goto :goto_30

    :cond_2e
    const/4 p3, -0x1

    goto :goto_7e

    .line 311
    :cond_30
    :goto_30
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->d:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v2

    :goto_37
    if-ltz v0, :cond_58

    .line 312
    iget-object v3, p0, Landroidx/fragment/app/FragmentManager;->d:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/l/d/a;

    if-eqz p3, :cond_4e

    .line 313
    invoke-virtual {v3}, Lb/l/d/a;->g()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4e

    goto :goto_58

    :cond_4e
    if-ltz p4, :cond_55

    .line 314
    iget v3, v3, Lb/l/d/a;->s:I

    if-ne p4, v3, :cond_55

    goto :goto_58

    :cond_55
    add-int/lit8 v0, v0, -0x1

    goto :goto_37

    :cond_58
    :goto_58
    if-gez v0, :cond_5b

    return v1

    :cond_5b
    and-int/2addr p5, v2

    if-eqz p5, :cond_7d

    :cond_5e
    :goto_5e
    add-int/lit8 v0, v0, -0x1

    if-ltz v0, :cond_7d

    .line 315
    iget-object p5, p0, Landroidx/fragment/app/FragmentManager;->d:Ljava/util/ArrayList;

    invoke-virtual {p5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Lb/l/d/a;

    if-eqz p3, :cond_76

    .line 316
    invoke-virtual {p5}, Lb/l/d/a;->g()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5e

    :cond_76
    if-ltz p4, :cond_7d

    iget p5, p5, Lb/l/d/a;->s:I

    if-ne p4, p5, :cond_7d

    goto :goto_5e

    :cond_7d
    move p3, v0

    .line 317
    :goto_7e
    iget-object p4, p0, Landroidx/fragment/app/FragmentManager;->d:Ljava/util/ArrayList;

    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result p4

    sub-int/2addr p4, v2

    if-ne p3, p4, :cond_88

    return v1

    .line 318
    :cond_88
    iget-object p4, p0, Landroidx/fragment/app/FragmentManager;->d:Ljava/util/ArrayList;

    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result p4

    sub-int/2addr p4, v2

    :goto_8f
    if-le p4, p3, :cond_a4

    .line 319
    iget-object p5, p0, Landroidx/fragment/app/FragmentManager;->d:Ljava/util/ArrayList;

    invoke-virtual {p5, p4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p5

    invoke-virtual {p1, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 320
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p5

    invoke-virtual {p2, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p4, p4, -0x1

    goto :goto_8f

    :cond_a4
    :goto_a4
    return v2
.end method

.method public b(I)Landroidx/fragment/app/Fragment;
    .registers 3

    .line 17
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v0, p1}, Lb/l/d/p;->b(I)Landroidx/fragment/app/Fragment;

    move-result-object p1

    return-object p1
.end method

.method public b(Ljava/lang/String;)Landroidx/fragment/app/Fragment;
    .registers 3

    .line 18
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v0, p1}, Lb/l/d/p;->b(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p1

    return-object p1
.end method

.method public b()Lb/l/d/q;
    .registers 2

    .line 2
    new-instance v0, Lb/l/d/a;

    invoke-direct {v0, p0}, Lb/l/d/a;-><init>(Landroidx/fragment/app/FragmentManager;)V

    return-object v0
.end method

.method public b(Landroidx/fragment/app/Fragment;)V
    .registers 6

    const/4 v0, 0x2

    .line 9
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v1

    const-string v2, "FragmentManager"

    if-eqz v1, :cond_1d

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "attach: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    :cond_1d
    iget-boolean v1, p1, Landroidx/fragment/app/Fragment;->H:Z

    if-eqz v1, :cond_50

    const/4 v1, 0x0

    .line 11
    iput-boolean v1, p1, Landroidx/fragment/app/Fragment;->H:Z

    .line 12
    iget-boolean v1, p1, Landroidx/fragment/app/Fragment;->s:Z

    if-nez v1, :cond_50

    .line 13
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v1, p1}, Lb/l/d/p;->a(Landroidx/fragment/app/Fragment;)V

    .line 14
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_47

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "add from attach: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    :cond_47
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->o(Landroidx/fragment/app/Fragment;)Z

    move-result p1

    if-eqz p1, :cond_50

    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Landroidx/fragment/app/FragmentManager;->D:Z

    :cond_50
    return-void
.end method

.method public b(Landroidx/fragment/app/Fragment;Lb/h/i/b;)V
    .registers 4

    .line 3
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->m:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    if-eqz v0, :cond_26

    .line 4
    invoke-virtual {v0, p2}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_26

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_26

    .line 5
    iget-object p2, p0, Landroidx/fragment/app/FragmentManager;->m:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    iget p2, p1, Landroidx/fragment/app/Fragment;->h:I

    const/4 v0, 0x5

    if-ge p2, v0, :cond_26

    .line 7
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->f(Landroidx/fragment/app/Fragment;)V

    .line 8
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->s(Landroidx/fragment/app/Fragment;)V

    :cond_26
    return-void
.end method

.method public b(Landroidx/fragment/app/FragmentManager$n;Z)V
    .registers 4

    if-eqz p2, :cond_b

    .line 19
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    if-eqz v0, :cond_a

    iget-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->G:Z

    if-eqz v0, :cond_b

    :cond_a
    return-void

    .line 20
    :cond_b
    invoke-virtual {p0, p2}, Landroidx/fragment/app/FragmentManager;->c(Z)V

    .line 21
    iget-object p2, p0, Landroidx/fragment/app/FragmentManager;->I:Ljava/util/ArrayList;

    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->J:Ljava/util/ArrayList;

    invoke-interface {p1, p2, v0}, Landroidx/fragment/app/FragmentManager$n;->a(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z

    move-result p1

    if-eqz p1, :cond_2b

    const/4 p1, 0x1

    .line 22
    iput-boolean p1, p0, Landroidx/fragment/app/FragmentManager;->b:Z

    .line 23
    :try_start_1b
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager;->I:Ljava/util/ArrayList;

    iget-object p2, p0, Landroidx/fragment/app/FragmentManager;->J:Ljava/util/ArrayList;

    invoke-virtual {p0, p1, p2}, Landroidx/fragment/app/FragmentManager;->c(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    :try_end_22
    .catchall {:try_start_1b .. :try_end_22} :catchall_26

    .line 24
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->e()V

    goto :goto_2b

    :catchall_26
    move-exception p1

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->e()V

    .line 25
    throw p1

    .line 26
    :cond_2b
    :goto_2b
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->Q()V

    .line 27
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->s()V

    .line 28
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {p1}, Lb/l/d/p;->a()V

    return-void
.end method

.method public final b(Lb/e/b;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/e/b<",
            "Landroidx/fragment/app/Fragment;",
            ">;)V"
        }
    .end annotation

    .line 29
    invoke-virtual {p1}, Lb/e/b;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_22

    .line 30
    invoke-virtual {p1, v1}, Lb/e/b;->d(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/fragment/app/Fragment;

    .line 31
    iget-boolean v3, v2, Landroidx/fragment/app/Fragment;->s:Z

    if-nez v3, :cond_1f

    .line 32
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->u0()Landroid/view/View;

    move-result-object v3

    .line 33
    invoke-virtual {v3}, Landroid/view/View;->getAlpha()F

    move-result v4

    iput v4, v2, Landroidx/fragment/app/Fragment;->U:F

    const/4 v2, 0x0

    .line 34
    invoke-virtual {v3, v2}, Landroid/view/View;->setAlpha(F)V

    :cond_1f
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_22
    return-void
.end method

.method public b(Z)V
    .registers 4

    .line 49
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v0}, Lb/l/d/p;->d()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    if-eqz v1, :cond_a

    .line 50
    invoke-virtual {v1, p1}, Landroidx/fragment/app/Fragment;->g(Z)V

    goto :goto_a

    :cond_1c
    return-void
.end method

.method public b(Landroid/view/Menu;)Z
    .registers 7

    .line 51
    iget v0, p0, Landroidx/fragment/app/FragmentManager;->q:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ge v0, v1, :cond_7

    return v2

    .line 52
    :cond_7
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v0}, Lb/l/d/p;->d()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_11
    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/fragment/app/Fragment;

    if-eqz v3, :cond_11

    .line 53
    invoke-virtual {p0, v3}, Landroidx/fragment/app/FragmentManager;->p(Landroidx/fragment/app/Fragment;)Z

    move-result v4

    if-eqz v4, :cond_11

    invoke-virtual {v3, p1}, Landroidx/fragment/app/Fragment;->d(Landroid/view/Menu;)Z

    move-result v3

    if-eqz v3, :cond_11

    const/4 v2, 0x1

    goto :goto_11

    :cond_2d
    return v2
.end method

.method public b(Landroid/view/MenuItem;)Z
    .registers 6

    .line 54
    iget v0, p0, Landroidx/fragment/app/FragmentManager;->q:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ge v0, v2, :cond_7

    return v1

    .line 55
    :cond_7
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v0}, Lb/l/d/p;->d()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_26

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/fragment/app/Fragment;

    if-eqz v3, :cond_11

    .line 56
    invoke-virtual {v3, p1}, Landroidx/fragment/app/Fragment;->d(Landroid/view/MenuItem;)Z

    move-result v3

    if-eqz v3, :cond_11

    return v2

    :cond_26
    return v1
.end method

.method public final b(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lb/l/d/a;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Boolean;",
            ">;)Z"
        }
    .end annotation

    .line 41
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->a:Ljava/util/ArrayList;

    monitor-enter v0

    .line 42
    :try_start_3
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_e

    .line 43
    monitor-exit v0

    return v2

    .line 44
    :cond_e
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v3, 0x0

    :goto_15
    if-ge v2, v1, :cond_27

    .line 45
    iget-object v4, p0, Landroidx/fragment/app/FragmentManager;->a:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/fragment/app/FragmentManager$n;

    invoke-interface {v4, p1, p2}, Landroidx/fragment/app/FragmentManager$n;->a(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z

    move-result v4

    or-int/2addr v3, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_15

    .line 46
    :cond_27
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager;->a:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 47
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    invoke-virtual {p1}, Lb/l/d/h;->i()Landroid/os/Handler;

    move-result-object p1

    iget-object p2, p0, Landroidx/fragment/app/FragmentManager;->N:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 48
    monitor-exit v0

    return v3

    :catchall_39
    move-exception p1

    monitor-exit v0
    :try_end_3b
    .catchall {:try_start_3 .. :try_end_3b} :catchall_39

    throw p1
.end method

.method public c(Ljava/lang/String;)Landroidx/fragment/app/Fragment;
    .registers 3

    .line 9
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v0, p1}, Lb/l/d/p;->c(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p1

    return-object p1
.end method

.method public final c(Landroidx/fragment/app/Fragment;)V
    .registers 5

    .line 3
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->m:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    if-eqz v0, :cond_29

    .line 4
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/h/i/b;

    .line 5
    invoke-virtual {v2}, Lb/h/i/b;->a()V

    goto :goto_e

    .line 6
    :cond_1e
    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 7
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->f(Landroidx/fragment/app/Fragment;)V

    .line 8
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->m:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_29
    return-void
.end method

.method public final c(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lb/l/d/a;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 26
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 27
    :cond_7
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ne v0, v1, :cond_62

    .line 28
    invoke-virtual {p0, p1, p2}, Landroidx/fragment/app/FragmentManager;->a(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 29
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_1a
    if-ge v1, v0, :cond_5c

    .line 30
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/l/d/a;

    iget-boolean v3, v3, Lb/l/d/q;->o:Z

    if-nez v3, :cond_59

    if-eq v2, v1, :cond_2b

    .line 31
    invoke-virtual {p0, p1, p2, v2, v1}, Landroidx/fragment/app/FragmentManager;->a(Ljava/util/ArrayList;Ljava/util/ArrayList;II)V

    :cond_2b
    add-int/lit8 v2, v1, 0x1

    .line 32
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_54

    :goto_39
    if-ge v2, v0, :cond_54

    .line 33
    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_54

    .line 34
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/l/d/a;

    iget-boolean v3, v3, Lb/l/d/q;->o:Z

    if-nez v3, :cond_54

    add-int/lit8 v2, v2, 0x1

    goto :goto_39

    .line 35
    :cond_54
    invoke-virtual {p0, p1, p2, v1, v2}, Landroidx/fragment/app/FragmentManager;->a(Ljava/util/ArrayList;Ljava/util/ArrayList;II)V

    add-int/lit8 v1, v2, -0x1

    :cond_59
    add-int/lit8 v1, v1, 0x1

    goto :goto_1a

    :cond_5c
    if-eq v2, v0, :cond_61

    .line 36
    invoke-virtual {p0, p1, p2, v2, v0}, Landroidx/fragment/app/FragmentManager;->a(Ljava/util/ArrayList;Ljava/util/ArrayList;II)V

    :cond_61
    return-void

    .line 37
    :cond_62
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Internal error with the back stack records"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final c(Z)V
    .registers 4

    .line 10
    iget-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->b:Z

    if-nez v0, :cond_5a

    .line 11
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    if-nez v0, :cond_1c

    .line 12
    iget-boolean p1, p0, Landroidx/fragment/app/FragmentManager;->G:Z

    if-eqz p1, :cond_14

    .line 13
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "FragmentManager has been destroyed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 14
    :cond_14
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "FragmentManager has not been attached to a host."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 15
    :cond_1c
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    invoke-virtual {v1}, Lb/l/d/h;->i()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_52

    if-nez p1, :cond_31

    .line 16
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->d()V

    .line 17
    :cond_31
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager;->I:Ljava/util/ArrayList;

    if-nez p1, :cond_43

    .line 18
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Landroidx/fragment/app/FragmentManager;->I:Ljava/util/ArrayList;

    .line 19
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Landroidx/fragment/app/FragmentManager;->J:Ljava/util/ArrayList;

    :cond_43
    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Landroidx/fragment/app/FragmentManager;->b:Z

    const/4 p1, 0x0

    const/4 v0, 0x0

    .line 21
    :try_start_48
    invoke-virtual {p0, v0, v0}, Landroidx/fragment/app/FragmentManager;->a(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    :try_end_4b
    .catchall {:try_start_48 .. :try_end_4b} :catchall_4e

    .line 22
    iput-boolean p1, p0, Landroidx/fragment/app/FragmentManager;->b:Z

    return-void

    :catchall_4e
    move-exception v0

    iput-boolean p1, p0, Landroidx/fragment/app/FragmentManager;->b:Z

    .line 23
    throw v0

    .line 24
    :cond_52
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Must be called from main thread of fragment host"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 25
    :cond_5a
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "FragmentManager is already executing transactions"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public c()Z
    .registers 5

    .line 38
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v0}, Lb/l/d/p;->c()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :cond_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/fragment/app/Fragment;

    if-eqz v3, :cond_1e

    .line 39
    invoke-virtual {p0, v3}, Landroidx/fragment/app/FragmentManager;->o(Landroidx/fragment/app/Fragment;)Z

    move-result v2

    :cond_1e
    if-eqz v2, :cond_c

    const/4 v0, 0x1

    return v0

    :cond_22
    return v1
.end method

.method public c(I)Z
    .registers 3

    .line 2
    iget v0, p0, Landroidx/fragment/app/FragmentManager;->q:I

    if-lt v0, p1, :cond_6

    const/4 p1, 0x1

    goto :goto_7

    :cond_6
    const/4 p1, 0x0

    :goto_7
    return p1
.end method

.method public d(Ljava/lang/String;)Landroidx/fragment/app/Fragment;
    .registers 3

    .line 26
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v0, p1}, Lb/l/d/p;->d(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p1

    return-object p1
.end method

.method public final d()V
    .registers 3

    .line 27
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->J()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 28
    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can not perform this action after onSaveInstanceState"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final d(Landroidx/fragment/app/Fragment;)V
    .registers 8

    .line 2
    iget-object v0, p1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    const/4 v1, 0x0

    if-eqz v0, :cond_77

    .line 3
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    .line 4
    invoke-virtual {v0}, Lb/l/d/h;->h()Landroid/content/Context;

    move-result-object v0

    iget-boolean v2, p1, Landroidx/fragment/app/Fragment;->G:Z

    xor-int/lit8 v2, v2, 0x1

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->B()Z

    move-result v3

    .line 5
    invoke-static {v0, p1, v2, v3}, Lb/l/d/d;->a(Landroid/content/Context;Landroidx/fragment/app/Fragment;ZZ)Lb/l/d/d$d;

    move-result-object v0

    if-eqz v0, :cond_4d

    .line 6
    iget-object v2, v0, Lb/l/d/d$d;->b:Landroid/animation/Animator;

    if-eqz v2, :cond_4d

    .line 7
    iget-object v3, p1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 8
    iget-boolean v2, p1, Landroidx/fragment/app/Fragment;->G:Z

    if-eqz v2, :cond_42

    .line 9
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->R()Z

    move-result v2

    if-eqz v2, :cond_30

    .line 10
    invoke-virtual {p1, v1}, Landroidx/fragment/app/Fragment;->h(Z)V

    goto :goto_47

    .line 11
    :cond_30
    iget-object v2, p1, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    .line 12
    iget-object v3, p1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    .line 13
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->startViewTransition(Landroid/view/View;)V

    .line 14
    iget-object v4, v0, Lb/l/d/d$d;->b:Landroid/animation/Animator;

    new-instance v5, Landroidx/fragment/app/FragmentManager$h;

    invoke-direct {v5, p0, v2, v3, p1}, Landroidx/fragment/app/FragmentManager$h;-><init>(Landroidx/fragment/app/FragmentManager;Landroid/view/ViewGroup;Landroid/view/View;Landroidx/fragment/app/Fragment;)V

    invoke-virtual {v4, v5}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    goto :goto_47

    .line 15
    :cond_42
    iget-object v2, p1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    :goto_47
    iget-object v0, v0, Lb/l/d/d$d;->b:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    goto :goto_77

    :cond_4d
    if-eqz v0, :cond_5b

    .line 17
    iget-object v2, p1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    iget-object v3, v0, Lb/l/d/d$d;->a:Landroid/view/animation/Animation;

    invoke-virtual {v2, v3}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 18
    iget-object v0, v0, Lb/l/d/d$d;->a:Landroid/view/animation/Animation;

    invoke-virtual {v0}, Landroid/view/animation/Animation;->start()V

    .line 19
    :cond_5b
    iget-boolean v0, p1, Landroidx/fragment/app/Fragment;->G:Z

    if-eqz v0, :cond_68

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->R()Z

    move-result v0

    if-nez v0, :cond_68

    const/16 v0, 0x8

    goto :goto_69

    :cond_68
    const/4 v0, 0x0

    .line 20
    :goto_69
    iget-object v2, p1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 21
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->R()Z

    move-result v0

    if-eqz v0, :cond_77

    .line 22
    invoke-virtual {p1, v1}, Landroidx/fragment/app/Fragment;->h(Z)V

    .line 23
    :cond_77
    :goto_77
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->n(Landroidx/fragment/app/Fragment;)V

    .line 24
    iput-boolean v1, p1, Landroidx/fragment/app/Fragment;->T:Z

    .line 25
    iget-boolean v0, p1, Landroidx/fragment/app/Fragment;->G:Z

    invoke-virtual {p1, v0}, Landroidx/fragment/app/Fragment;->b(Z)V

    return-void
.end method

.method public d(Z)Z
    .registers 5

    .line 29
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->c(Z)V

    const/4 p1, 0x1

    const/4 v0, 0x0

    .line 30
    :goto_5
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->I:Ljava/util/ArrayList;

    iget-object v2, p0, Landroidx/fragment/app/FragmentManager;->J:Ljava/util/ArrayList;

    invoke-virtual {p0, v1, v2}, Landroidx/fragment/app/FragmentManager;->b(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 31
    iput-boolean p1, p0, Landroidx/fragment/app/FragmentManager;->b:Z

    .line 32
    :try_start_11
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->I:Ljava/util/ArrayList;

    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->J:Ljava/util/ArrayList;

    invoke-virtual {p0, v0, v1}, Landroidx/fragment/app/FragmentManager;->c(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    :try_end_18
    .catchall {:try_start_11 .. :try_end_18} :catchall_1d

    .line 33
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->e()V

    const/4 v0, 0x1

    goto :goto_5

    :catchall_1d
    move-exception p1

    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->e()V

    .line 34
    throw p1

    .line 35
    :cond_22
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->Q()V

    .line 36
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->s()V

    .line 37
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {p1}, Lb/l/d/p;->a()V

    return v0
.end method

.method public e(Landroidx/fragment/app/Fragment;)Lb/l/d/o;
    .registers 5

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    iget-object v1, p1, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lb/l/d/p;->e(Ljava/lang/String;)Lb/l/d/o;

    move-result-object v0

    if-eqz v0, :cond_b

    return-object v0

    .line 2
    :cond_b
    new-instance v0, Lb/l/d/o;

    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->o:Lb/l/d/j;

    iget-object v2, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-direct {v0, v1, v2, p1}, Lb/l/d/o;-><init>(Lb/l/d/j;Lb/l/d/p;Landroidx/fragment/app/Fragment;)V

    .line 3
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    invoke-virtual {p1}, Lb/l/d/h;->h()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p1

    invoke-virtual {v0, p1}, Lb/l/d/o;->a(Ljava/lang/ClassLoader;)V

    .line 4
    iget p1, p0, Landroidx/fragment/app/FragmentManager;->q:I

    invoke-virtual {v0, p1}, Lb/l/d/o;->a(I)V

    return-object v0
.end method

.method public final e()V
    .registers 2

    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->b:Z

    .line 6
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->J:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 7
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->I:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public final f()Ljava/util/Set;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lb/l/d/w;",
            ">;"
        }
    .end annotation

    .line 8
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 9
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v1}, Lb/l/d/p;->b()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_f
    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/l/d/o;

    .line 10
    invoke-virtual {v2}, Lb/l/d/o;->k()Landroidx/fragment/app/Fragment;

    move-result-object v2

    iget-object v2, v2, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    if-eqz v2, :cond_f

    .line 11
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->G()Lb/l/d/x;

    move-result-object v3

    .line 12
    invoke-static {v2, v3}, Lb/l/d/w;->a(Landroid/view/ViewGroup;Lb/l/d/x;)Lb/l/d/w;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_f

    :cond_2f
    return-object v0
.end method

.method public final f(Landroidx/fragment/app/Fragment;)V
    .registers 5

    .line 1
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->j0()V

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->o:Lb/l/d/j;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lb/l/d/j;->i(Landroidx/fragment/app/Fragment;Z)V

    const/4 v0, 0x0

    .line 3
    iput-object v0, p1, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    .line 4
    iput-object v0, p1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    .line 5
    iput-object v0, p1, Landroidx/fragment/app/Fragment;->Z:Lb/l/d/u;

    .line 6
    iget-object v2, p1, Landroidx/fragment/app/Fragment;->a0:Lb/n/m;

    invoke-virtual {v2, v0}, Lb/n/m;->a(Ljava/lang/Object;)V

    .line 7
    iput-boolean v1, p1, Landroidx/fragment/app/Fragment;->v:Z

    return-void
.end method

.method public g()V
    .registers 3

    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->E:Z

    .line 11
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->F:Z

    .line 12
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->M:Lb/l/d/l;

    invoke-virtual {v1, v0}, Lb/l/d/l;->a(Z)V

    const/4 v0, 0x4

    .line 13
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->a(I)V

    return-void
.end method

.method public g(Landroidx/fragment/app/Fragment;)V
    .registers 6

    const/4 v0, 0x2

    .line 1
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v1

    const-string v2, "FragmentManager"

    if-eqz v1, :cond_1d

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "detach: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2
    :cond_1d
    iget-boolean v1, p1, Landroidx/fragment/app/Fragment;->H:Z

    if-nez v1, :cond_52

    const/4 v1, 0x1

    .line 3
    iput-boolean v1, p1, Landroidx/fragment/app/Fragment;->H:Z

    .line 4
    iget-boolean v3, p1, Landroidx/fragment/app/Fragment;->s:Z

    if-eqz v3, :cond_52

    .line 5
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_42

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "remove from detach: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    :cond_42
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v0, p1}, Lb/l/d/p;->c(Landroidx/fragment/app/Fragment;)V

    .line 7
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->o(Landroidx/fragment/app/Fragment;)Z

    move-result v0

    if-eqz v0, :cond_4f

    .line 8
    iput-boolean v1, p0, Landroidx/fragment/app/FragmentManager;->D:Z

    .line 9
    :cond_4f
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->v(Landroidx/fragment/app/Fragment;)V

    :cond_52
    return-void
.end method

.method public h()V
    .registers 3

    const/4 v0, 0x0

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->E:Z

    .line 2
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->F:Z

    .line 3
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->M:Lb/l/d/l;

    invoke-virtual {v1, v0}, Lb/l/d/l;->a(Z)V

    .line 4
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->a(I)V

    return-void
.end method

.method public h(Landroidx/fragment/app/Fragment;)V
    .registers 4

    .line 5
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->p:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/m;

    .line 6
    invoke-interface {v1, p0, p1}, Lb/l/d/m;->a(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public i()V
    .registers 3

    const/4 v0, 0x0

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->E:Z

    .line 2
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->F:Z

    .line 3
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->M:Lb/l/d/l;

    invoke-virtual {v1, v0}, Lb/l/d/l;->a(Z)V

    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->a(I)V

    return-void
.end method

.method public final i(Landroidx/fragment/app/Fragment;)V
    .registers 3

    if-eqz p1, :cond_11

    .line 5
    iget-object v0, p1, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->b(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/fragment/app/Fragment;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 6
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->n0()V

    :cond_11
    return-void
.end method

.method public final j(Landroidx/fragment/app/Fragment;)Lb/l/d/l;
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->M:Lb/l/d/l;

    invoke-virtual {v0, p1}, Lb/l/d/l;->c(Landroidx/fragment/app/Fragment;)Lb/l/d/l;

    move-result-object p1

    return-object p1
.end method

.method public j()V
    .registers 3

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->G:Z

    .line 3
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->d(Z)Z

    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->t()V

    const/4 v0, -0x1

    .line 5
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->a(I)V

    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    .line 7
    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->s:Lb/l/d/e;

    .line 8
    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->t:Landroidx/fragment/app/Fragment;

    .line 9
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->g:Landroidx/activity/OnBackPressedDispatcher;

    if-eqz v1, :cond_1f

    .line 10
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->h:Lb/a/b;

    invoke-virtual {v1}, Lb/a/b;->c()V

    .line 11
    iput-object v0, p0, Landroidx/fragment/app/FragmentManager;->g:Landroidx/activity/OnBackPressedDispatcher;

    .line 12
    :cond_1f
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->z:Lb/a/e/b;

    if-eqz v0, :cond_30

    .line 13
    invoke-virtual {v0}, Lb/a/e/b;->a()V

    .line 14
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->A:Lb/a/e/b;

    invoke-virtual {v0}, Lb/a/e/b;->a()V

    .line 15
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->B:Lb/a/e/b;

    invoke-virtual {v0}, Lb/a/e/b;->a()V

    :cond_30
    return-void
.end method

.method public final k(Landroidx/fragment/app/Fragment;)Landroid/view/ViewGroup;
    .registers 4

    .line 1
    iget-object v0, p1, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    if-eqz v0, :cond_5

    return-object v0

    .line 2
    :cond_5
    iget v0, p1, Landroidx/fragment/app/Fragment;->E:I

    const/4 v1, 0x0

    if-gtz v0, :cond_b

    return-object v1

    .line 3
    :cond_b
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->s:Lb/l/d/e;

    invoke-virtual {v0}, Lb/l/d/e;->e()Z

    move-result v0

    if-eqz v0, :cond_22

    .line 4
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->s:Lb/l/d/e;

    iget p1, p1, Landroidx/fragment/app/Fragment;->E:I

    invoke-virtual {v0, p1}, Lb/l/d/e;->a(I)Landroid/view/View;

    move-result-object p1

    .line 5
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_22

    .line 6
    check-cast p1, Landroid/view/ViewGroup;

    return-object p1

    :cond_22
    return-object v1
.end method

.method public k()V
    .registers 2

    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->a(I)V

    return-void
.end method

.method public l(Landroidx/fragment/app/Fragment;)Lb/n/s;
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->M:Lb/l/d/l;

    invoke-virtual {v0, p1}, Lb/l/d/l;->d(Landroidx/fragment/app/Fragment;)Lb/n/s;

    move-result-object p1

    return-object p1
.end method

.method public l()V
    .registers 3

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v0}, Lb/l/d/p;->d()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    if-eqz v1, :cond_a

    .line 3
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->l0()V

    goto :goto_a

    :cond_1c
    return-void
.end method

.method public m()V
    .registers 2

    const/4 v0, 0x5

    .line 6
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->a(I)V

    return-void
.end method

.method public m(Landroidx/fragment/app/Fragment;)V
    .registers 4

    const/4 v0, 0x2

    .line 1
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_1d

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "hide: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2
    :cond_1d
    iget-boolean v0, p1, Landroidx/fragment/app/Fragment;->G:Z

    if-nez v0, :cond_2c

    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p1, Landroidx/fragment/app/Fragment;->G:Z

    .line 4
    iget-boolean v1, p1, Landroidx/fragment/app/Fragment;->T:Z

    xor-int/2addr v0, v1

    iput-boolean v0, p1, Landroidx/fragment/app/Fragment;->T:Z

    .line 5
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->v(Landroidx/fragment/app/Fragment;)V

    :cond_2c
    return-void
.end method

.method public n()V
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->Q()V

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->u:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->i(Landroidx/fragment/app/Fragment;)V

    return-void
.end method

.method public n(Landroidx/fragment/app/Fragment;)V
    .registers 3

    .line 3
    iget-boolean v0, p1, Landroidx/fragment/app/Fragment;->s:Z

    if-eqz v0, :cond_d

    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->o(Landroidx/fragment/app/Fragment;)Z

    move-result p1

    if-eqz p1, :cond_d

    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Landroidx/fragment/app/FragmentManager;->D:Z

    :cond_d
    return-void
.end method

.method public o()V
    .registers 3

    const/4 v0, 0x0

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->E:Z

    .line 2
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->F:Z

    .line 3
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->M:Lb/l/d/l;

    invoke-virtual {v1, v0}, Lb/l/d/l;->a(Z)V

    const/4 v0, 0x7

    .line 4
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->a(I)V

    return-void
.end method

.method public final o(Landroidx/fragment/app/Fragment;)Z
    .registers 3

    .line 5
    iget-boolean v0, p1, Landroidx/fragment/app/Fragment;->K:Z

    if-eqz v0, :cond_8

    iget-boolean v0, p1, Landroidx/fragment/app/Fragment;->L:Z

    if-nez v0, :cond_10

    :cond_8
    iget-object p1, p1, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->c()Z

    move-result p1

    if-eqz p1, :cond_12

    :cond_10
    const/4 p1, 0x1

    goto :goto_13

    :cond_12
    const/4 p1, 0x0

    :goto_13
    return p1
.end method

.method public p()V
    .registers 3

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->E:Z

    .line 3
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->F:Z

    .line 4
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->M:Lb/l/d/l;

    invoke-virtual {v1, v0}, Lb/l/d/l;->a(Z)V

    const/4 v0, 0x5

    .line 5
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->a(I)V

    return-void
.end method

.method public p(Landroidx/fragment/app/Fragment;)Z
    .registers 2

    if-nez p1, :cond_4

    const/4 p1, 0x1

    return p1

    .line 1
    :cond_4
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->T()Z

    move-result p1

    return p1
.end method

.method public q()V
    .registers 3

    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->F:Z

    .line 6
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->M:Lb/l/d/l;

    invoke-virtual {v1, v0}, Lb/l/d/l;->a(Z)V

    const/4 v0, 0x4

    .line 7
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->a(I)V

    return-void
.end method

.method public q(Landroidx/fragment/app/Fragment;)Z
    .registers 5

    const/4 v0, 0x1

    if-nez p1, :cond_4

    return v0

    .line 1
    :cond_4
    iget-object v1, p1, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    .line 2
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->F()Landroidx/fragment/app/Fragment;

    move-result-object v2

    .line 3
    invoke-virtual {p1, v2}, Landroidx/fragment/app/Fragment;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_19

    iget-object p1, v1, Landroidx/fragment/app/FragmentManager;->t:Landroidx/fragment/app/Fragment;

    .line 4
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->q(Landroidx/fragment/app/Fragment;)Z

    move-result p1

    if-eqz p1, :cond_19

    goto :goto_1a

    :cond_19
    const/4 v0, 0x0

    :goto_1a
    return v0
.end method

.method public r()V
    .registers 2

    const/4 v0, 0x2

    .line 20
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->a(I)V

    return-void
.end method

.method public r(Landroidx/fragment/app/Fragment;)V
    .registers 6

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    iget-object v1, p1, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lb/l/d/p;->a(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3a

    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_39

    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Ignoring moving "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " to state "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Landroidx/fragment/app/FragmentManager;->q:I

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "since it is not added to "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "FragmentManager"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_39
    return-void

    .line 4
    :cond_3a
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->s(Landroidx/fragment/app/Fragment;)V

    .line 5
    iget-object v0, p1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v0, :cond_7f

    .line 6
    iget-boolean v1, p1, Landroidx/fragment/app/Fragment;->S:Z

    if-eqz v1, :cond_7f

    iget-object v1, p1, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    if-eqz v1, :cond_7f

    .line 7
    iget v1, p1, Landroidx/fragment/app/Fragment;->U:F

    const/4 v2, 0x0

    cmpl-float v3, v1, v2

    if-lez v3, :cond_53

    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 9
    :cond_53
    iput v2, p1, Landroidx/fragment/app/Fragment;->U:F

    const/4 v0, 0x0

    .line 10
    iput-boolean v0, p1, Landroidx/fragment/app/Fragment;->S:Z

    .line 11
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    .line 12
    invoke-virtual {v0}, Lb/l/d/h;->h()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->B()Z

    move-result v2

    .line 13
    invoke-static {v0, p1, v1, v2}, Lb/l/d/d;->a(Landroid/content/Context;Landroidx/fragment/app/Fragment;ZZ)Lb/l/d/d$d;

    move-result-object v0

    if-eqz v0, :cond_7f

    .line 14
    iget-object v1, v0, Lb/l/d/d$d;->a:Landroid/view/animation/Animation;

    if-eqz v1, :cond_73

    .line 15
    iget-object v0, p1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_7f

    .line 16
    :cond_73
    iget-object v1, v0, Lb/l/d/d$d;->b:Landroid/animation/Animator;

    iget-object v2, p1, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 17
    iget-object v0, v0, Lb/l/d/d$d;->b:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 18
    :cond_7f
    :goto_7f
    iget-boolean v0, p1, Landroidx/fragment/app/Fragment;->T:Z

    if-eqz v0, :cond_86

    .line 19
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->d(Landroidx/fragment/app/Fragment;)V

    :cond_86
    return-void
.end method

.method public final s()V
    .registers 2

    .line 2
    iget-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->H:Z

    if-eqz v0, :cond_a

    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Landroidx/fragment/app/FragmentManager;->H:Z

    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->P()V

    :cond_a
    return-void
.end method

.method public s(Landroidx/fragment/app/Fragment;)V
    .registers 3

    .line 1
    iget v0, p0, Landroidx/fragment/app/FragmentManager;->q:I

    invoke-virtual {p0, p1, v0}, Landroidx/fragment/app/FragmentManager;->a(Landroidx/fragment/app/Fragment;I)V

    return-void
.end method

.method public final t()V
    .registers 3

    .line 10
    sget-boolean v0, Landroidx/fragment/app/FragmentManager;->P:Z

    if-eqz v0, :cond_1c

    .line 11
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->f()Ljava/util/Set;

    move-result-object v0

    .line 12
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_41

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/w;

    .line 13
    invoke-virtual {v1}, Lb/l/d/w;->b()V

    goto :goto_c

    .line 14
    :cond_1c
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->m:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_41

    .line 15
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->m:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_41

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    .line 16
    invoke-virtual {p0, v1}, Landroidx/fragment/app/FragmentManager;->c(Landroidx/fragment/app/Fragment;)V

    .line 17
    invoke-virtual {p0, v1}, Landroidx/fragment/app/FragmentManager;->s(Landroidx/fragment/app/Fragment;)V

    goto :goto_2e

    :cond_41
    return-void
.end method

.method public t(Landroidx/fragment/app/Fragment;)V
    .registers 5

    const/4 v0, 0x2

    .line 1
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "remove: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " nesting="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p1, Landroidx/fragment/app/Fragment;->y:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    :cond_27
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->S()Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    .line 4
    iget-boolean v2, p1, Landroidx/fragment/app/Fragment;->H:Z

    if-eqz v2, :cond_33

    if-eqz v0, :cond_45

    .line 5
    :cond_33
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    invoke-virtual {v0, p1}, Lb/l/d/p;->c(Landroidx/fragment/app/Fragment;)V

    .line 6
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->o(Landroidx/fragment/app/Fragment;)Z

    move-result v0

    if-eqz v0, :cond_40

    .line 7
    iput-boolean v1, p0, Landroidx/fragment/app/FragmentManager;->D:Z

    .line 8
    :cond_40
    iput-boolean v1, p1, Landroidx/fragment/app/Fragment;->t:Z

    .line 9
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->v(Landroidx/fragment/app/Fragment;)V

    :cond_45
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "FragmentManager{"

    .line 2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " in "

    .line 4
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 5
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->t:Landroidx/fragment/app/Fragment;

    const-string v2, "}"

    const-string v3, "{"

    if-eqz v1, :cond_43

    .line 6
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 8
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->t:Landroidx/fragment/app/Fragment;

    invoke-static {v1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 10
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_6b

    .line 11
    :cond_43
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    if-eqz v1, :cond_66

    .line 12
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    iget-object v1, p0, Landroidx/fragment/app/FragmentManager;->r:Lb/l/d/h;

    invoke-static {v1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_6b

    :cond_66
    const-string v1, "null"

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_6b
    const-string v1, "}}"

    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public u(Landroidx/fragment/app/Fragment;)V
    .registers 5

    if-eqz p1, :cond_36

    .line 3
    iget-object v0, p1, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->b(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/fragment/app/Fragment;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    iget-object v0, p1, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    if-eqz v0, :cond_36

    iget-object v0, p1, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    if-ne v0, p0, :cond_17

    goto :goto_36

    .line 4
    :cond_17
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " is not an active fragment of FragmentManager "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 5
    :cond_36
    :goto_36
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->u:Landroidx/fragment/app/Fragment;

    .line 6
    iput-object p1, p0, Landroidx/fragment/app/FragmentManager;->u:Landroidx/fragment/app/Fragment;

    .line 7
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->i(Landroidx/fragment/app/Fragment;)V

    .line 8
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager;->u:Landroidx/fragment/app/Fragment;

    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->i(Landroidx/fragment/app/Fragment;)V

    return-void
.end method

.method public u()Z
    .registers 2

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->d(Z)Z

    move-result v0

    .line 2
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->v()V

    return v0
.end method

.method public final v()V
    .registers 3

    .line 7
    sget-boolean v0, Landroidx/fragment/app/FragmentManager;->P:Z

    if-eqz v0, :cond_1c

    .line 8
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->f()Ljava/util/Set;

    move-result-object v0

    .line 9
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_35

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb/l/d/w;

    .line 10
    invoke-virtual {v1}, Lb/l/d/w;->c()V

    goto :goto_c

    .line 11
    :cond_1c
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->L:Ljava/util/ArrayList;

    if-eqz v0, :cond_35

    .line 12
    :goto_20
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->L:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_35

    .line 13
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->L:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/fragment/app/FragmentManager$p;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager$p;->d()V

    goto :goto_20

    :cond_35
    return-void
.end method

.method public final v(Landroidx/fragment/app/Fragment;)V
    .registers 5

    .line 1
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->k(Landroidx/fragment/app/Fragment;)Landroid/view/ViewGroup;

    move-result-object v0

    if-eqz v0, :cond_37

    .line 2
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->p()I

    move-result v1

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->s()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->C()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->D()I

    move-result v2

    add-int/2addr v1, v2

    if-lez v1, :cond_37

    .line 3
    sget v1, Lb/l/b;->visible_removing_fragment_view_tag:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_28

    .line 4
    sget v1, Lb/l/b;->visible_removing_fragment_view_tag:I

    invoke-virtual {v0, v1, p1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 5
    :cond_28
    sget v1, Lb/l/b;->visible_removing_fragment_view_tag:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/fragment/app/Fragment;

    .line 6
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->B()Z

    move-result p1

    invoke-virtual {v0, p1}, Landroidx/fragment/app/Fragment;->i(Z)V

    :cond_37
    return-void
.end method

.method public w()I
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->d:Ljava/util/ArrayList;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public w(Landroidx/fragment/app/Fragment;)V
    .registers 4

    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_1d

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "show: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    :cond_1d
    iget-boolean v0, p1, Landroidx/fragment/app/Fragment;->G:Z

    if-eqz v0, :cond_2a

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p1, Landroidx/fragment/app/Fragment;->G:Z

    .line 5
    iget-boolean v0, p1, Landroidx/fragment/app/Fragment;->T:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p1, Landroidx/fragment/app/Fragment;->T:Z

    :cond_2a
    return-void
.end method

.method public x()Lb/l/d/e;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->s:Lb/l/d/e;

    return-object v0
.end method

.method public y()Lb/l/d/g;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->v:Lb/l/d/g;

    if-eqz v0, :cond_5

    return-object v0

    .line 2
    :cond_5
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->t:Landroidx/fragment/app/Fragment;

    if-eqz v0, :cond_10

    .line 3
    iget-object v0, v0, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->y()Lb/l/d/g;

    move-result-object v0

    return-object v0

    .line 4
    :cond_10
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->w:Lb/l/d/g;

    return-object v0
.end method

.method public z()Lb/l/d/p;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager;->c:Lb/l/d/p;

    return-object v0
.end method
