.class public Landroidx/fragment/app/Fragment;
.super Ljava/lang/Object;
.source "Fragment.java"

# interfaces
.implements Landroid/content/ComponentCallbacks;
.implements Landroid/view/View$OnCreateContextMenuListener;
.implements Lb/n/h;
.implements Lb/n/t;
.implements Lb/q/c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/fragment/app/Fragment$e;,
        Landroidx/fragment/app/Fragment$h;,
        Landroidx/fragment/app/Fragment$f;,
        Landroidx/fragment/app/Fragment$SavedState;,
        Landroidx/fragment/app/Fragment$g;
    }
.end annotation


# static fields
.field public static final e0:Ljava/lang/Object;


# instance fields
.field public A:Lb/l/d/h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/l/d/h<",
            "*>;"
        }
    .end annotation
.end field

.field public B:Landroidx/fragment/app/FragmentManager;

.field public C:Landroidx/fragment/app/Fragment;

.field public D:I

.field public E:I

.field public F:Ljava/lang/String;

.field public G:Z

.field public H:Z

.field public I:Z

.field public J:Z

.field public K:Z

.field public L:Z

.field public M:Z

.field public N:Landroid/view/ViewGroup;

.field public O:Landroid/view/View;

.field public P:Z

.field public Q:Z

.field public R:Landroidx/fragment/app/Fragment$e;

.field public S:Z

.field public T:Z

.field public U:F

.field public V:Landroid/view/LayoutInflater;

.field public W:Z

.field public X:Lb/n/e$c;

.field public Y:Lb/n/i;

.field public Z:Lb/l/d/u;

.field public a0:Lb/n/m;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/n/m<",
            "Lb/n/h;",
            ">;"
        }
    .end annotation
.end field

.field public b0:Lb/q/b;

.field public c0:I

.field public final d0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/fragment/app/Fragment$g;",
            ">;"
        }
    .end annotation
.end field

.field public h:I

.field public i:Landroid/os/Bundle;

.field public j:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/os/Parcelable;",
            ">;"
        }
    .end annotation
.end field

.field public k:Landroid/os/Bundle;

.field public l:Ljava/lang/Boolean;

.field public m:Ljava/lang/String;

.field public n:Landroid/os/Bundle;

.field public o:Landroidx/fragment/app/Fragment;

.field public p:Ljava/lang/String;

.field public q:I

.field public r:Ljava/lang/Boolean;

.field public s:Z

.field public t:Z

.field public u:Z

.field public v:Z

.field public w:Z

.field public x:Z

.field public y:I

.field public z:Landroidx/fragment/app/FragmentManager;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroidx/fragment/app/Fragment;->e0:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Landroidx/fragment/app/Fragment;->h:I

    .line 3
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Landroidx/fragment/app/Fragment;->p:Ljava/lang/String;

    .line 5
    iput-object v0, p0, Landroidx/fragment/app/Fragment;->r:Ljava/lang/Boolean;

    .line 6
    new-instance v0, Lb/l/d/k;

    invoke-direct {v0}, Lb/l/d/k;-><init>()V

    iput-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->L:Z

    .line 8
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->Q:Z

    .line 9
    new-instance v0, Landroidx/fragment/app/Fragment$a;

    invoke-direct {v0, p0}, Landroidx/fragment/app/Fragment$a;-><init>(Landroidx/fragment/app/Fragment;)V

    .line 10
    sget-object v0, Lb/n/e$c;->RESUMED:Lb/n/e$c;

    iput-object v0, p0, Landroidx/fragment/app/Fragment;->X:Lb/n/e$c;

    .line 11
    new-instance v0, Lb/n/m;

    invoke-direct {v0}, Lb/n/m;-><init>()V

    iput-object v0, p0, Landroidx/fragment/app/Fragment;->a0:Lb/n/m;

    .line 12
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 13
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/fragment/app/Fragment;->d0:Ljava/util/ArrayList;

    .line 14
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->O()V

    return-void
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroidx/fragment/app/Fragment;
    .registers 7
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, ": make sure class name exists, is public, and has an empty constructor that is public"

    const-string v1, "Unable to instantiate fragment "

    .line 2
    :try_start_4
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p0

    .line 3
    invoke-static {p0, p1}, Lb/l/d/g;->d(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    .line 4
    invoke-virtual {p0, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/fragment/app/Fragment;

    if-eqz p2, :cond_2b

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 6
    invoke-virtual {p0, p2}, Landroidx/fragment/app/Fragment;->m(Landroid/os/Bundle;)V
    :try_end_2b
    .catch Ljava/lang/InstantiationException; {:try_start_4 .. :try_end_2b} :catch_7b
    .catch Ljava/lang/IllegalAccessException; {:try_start_4 .. :try_end_2b} :catch_62
    .catch Ljava/lang/NoSuchMethodException; {:try_start_4 .. :try_end_2b} :catch_47
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_4 .. :try_end_2b} :catch_2c

    :cond_2b
    return-object p0

    :catch_2c
    move-exception p0

    .line 7
    new-instance p2, Landroidx/fragment/app/Fragment$f;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": calling Fragment constructor caused an exception"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1, p0}, Landroidx/fragment/app/Fragment$f;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p2

    :catch_47
    move-exception p0

    .line 8
    new-instance p2, Landroidx/fragment/app/Fragment$f;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": could not find Fragment constructor"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1, p0}, Landroidx/fragment/app/Fragment$f;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p2

    :catch_62
    move-exception p0

    .line 9
    new-instance p2, Landroidx/fragment/app/Fragment$f;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1, p0}, Landroidx/fragment/app/Fragment$f;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p2

    :catch_7b
    move-exception p0

    .line 10
    new-instance p2, Landroidx/fragment/app/Fragment$f;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1, p0}, Landroidx/fragment/app/Fragment$f;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p2
.end method


# virtual methods
.method public final A()Landroidx/fragment/app/FragmentManager;
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    if-eqz v0, :cond_5

    return-object v0

    .line 2
    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " not associated with a fragment manager."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public B()Z
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return v0

    .line 2
    :cond_6
    iget-boolean v0, v0, Landroidx/fragment/app/Fragment$e;->c:Z

    return v0
.end method

.method public C()I
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return v0

    .line 2
    :cond_6
    iget v0, v0, Landroidx/fragment/app/Fragment$e;->f:I

    return v0
.end method

.method public D()I
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return v0

    .line 2
    :cond_6
    iget v0, v0, Landroidx/fragment/app/Fragment$e;->g:I

    return v0
.end method

.method public E()F
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_7

    const/high16 v0, 0x3f800000    # 1.0f

    return v0

    .line 2
    :cond_7
    iget v0, v0, Landroidx/fragment/app/Fragment$e;->u:F

    return v0
.end method

.method public F()Ljava/lang/Object;
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return-object v0

    .line 2
    :cond_6
    iget-object v0, v0, Landroidx/fragment/app/Fragment$e;->n:Ljava/lang/Object;

    sget-object v1, Landroidx/fragment/app/Fragment;->e0:Ljava/lang/Object;

    if-ne v0, v1, :cond_10

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->t()Ljava/lang/Object;

    move-result-object v0

    :cond_10
    return-object v0
.end method

.method public G()Ljava/lang/Object;
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return-object v0

    .line 2
    :cond_6
    iget-object v0, v0, Landroidx/fragment/app/Fragment$e;->l:Ljava/lang/Object;

    sget-object v1, Landroidx/fragment/app/Fragment;->e0:Ljava/lang/Object;

    if-ne v0, v1, :cond_10

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->q()Ljava/lang/Object;

    move-result-object v0

    :cond_10
    return-object v0
.end method

.method public H()Ljava/lang/Object;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return-object v0

    .line 2
    :cond_6
    iget-object v0, v0, Landroidx/fragment/app/Fragment$e;->o:Ljava/lang/Object;

    return-object v0
.end method

.method public I()Ljava/lang/Object;
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return-object v0

    .line 2
    :cond_6
    iget-object v0, v0, Landroidx/fragment/app/Fragment$e;->p:Ljava/lang/Object;

    sget-object v1, Landroidx/fragment/app/Fragment;->e0:Ljava/lang/Object;

    if-ne v0, v1, :cond_10

    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->H()Ljava/lang/Object;

    move-result-object v0

    :cond_10
    return-object v0
.end method

.method public J()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-eqz v0, :cond_a

    iget-object v0, v0, Landroidx/fragment/app/Fragment$e;->i:Ljava/util/ArrayList;

    if-nez v0, :cond_9

    goto :goto_a

    :cond_9
    return-object v0

    .line 2
    :cond_a
    :goto_a
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method public K()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-eqz v0, :cond_a

    iget-object v0, v0, Landroidx/fragment/app/Fragment$e;->j:Ljava/util/ArrayList;

    if-nez v0, :cond_9

    goto :goto_a

    :cond_9
    return-object v0

    .line 2
    :cond_a
    :goto_a
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method public final L()Landroidx/fragment/app/Fragment;
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->o:Landroidx/fragment/app/Fragment;

    if-eqz v0, :cond_5

    return-object v0

    .line 2
    :cond_5
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    if-eqz v0, :cond_12

    iget-object v1, p0, Landroidx/fragment/app/Fragment;->p:Ljava/lang/String;

    if-eqz v1, :cond_12

    .line 3
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->b(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    return-object v0

    :cond_12
    const/4 v0, 0x0

    return-object v0
.end method

.method public M()Landroid/view/View;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    return-object v0
.end method

.method public N()Landroidx/lifecycle/LiveData;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Lb/n/h;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->a0:Lb/n/m;

    return-object v0
.end method

.method public final O()V
    .registers 2

    .line 1
    new-instance v0, Lb/n/i;

    invoke-direct {v0, p0}, Lb/n/i;-><init>(Lb/n/h;)V

    iput-object v0, p0, Landroidx/fragment/app/Fragment;->Y:Lb/n/i;

    .line 2
    invoke-static {p0}, Lb/q/b;->a(Lb/q/c;)Lb/q/b;

    move-result-object v0

    iput-object v0, p0, Landroidx/fragment/app/Fragment;->b0:Lb/q/b;

    return-void
.end method

.method public P()V
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->O()V

    .line 2
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->s:Z

    .line 4
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->t:Z

    .line 5
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->u:Z

    .line 6
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->v:Z

    .line 7
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->w:Z

    .line 8
    iput v0, p0, Landroidx/fragment/app/Fragment;->y:I

    const/4 v1, 0x0

    .line 9
    iput-object v1, p0, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    .line 10
    new-instance v2, Lb/l/d/k;

    invoke-direct {v2}, Lb/l/d/k;-><init>()V

    iput-object v2, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    .line 11
    iput-object v1, p0, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    .line 12
    iput v0, p0, Landroidx/fragment/app/Fragment;->D:I

    .line 13
    iput v0, p0, Landroidx/fragment/app/Fragment;->E:I

    .line 14
    iput-object v1, p0, Landroidx/fragment/app/Fragment;->F:Ljava/lang/String;

    .line 15
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->G:Z

    .line 16
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->H:Z

    return-void
.end method

.method public final Q()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->H:Z

    return v0
.end method

.method public R()Z
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return v0

    .line 2
    :cond_6
    iget-boolean v0, v0, Landroidx/fragment/app/Fragment$e;->y:Z

    return v0
.end method

.method public final S()Z
    .registers 2

    .line 1
    iget v0, p0, Landroidx/fragment/app/Fragment;->y:I

    if-lez v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public final T()Z
    .registers 3

    .line 1
    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->L:Z

    if-eqz v0, :cond_12

    iget-object v0, p0, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    if-eqz v0, :cond_10

    iget-object v1, p0, Landroidx/fragment/app/Fragment;->C:Landroidx/fragment/app/Fragment;

    .line 2
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->p(Landroidx/fragment/app/Fragment;)Z

    move-result v0

    if-eqz v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    :goto_13
    return v0
.end method

.method public U()Z
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return v0

    .line 2
    :cond_6
    iget-boolean v0, v0, Landroidx/fragment/app/Fragment$e;->w:Z

    return v0
.end method

.method public final V()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->t:Z

    return v0
.end method

.method public final W()Z
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->z()Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_14

    .line 2
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->V()Z

    move-result v1

    if-nez v1, :cond_12

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->W()Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_12
    const/4 v0, 0x1

    goto :goto_15

    :cond_14
    const/4 v0, 0x0

    :goto_15
    return v0
.end method

.method public final X()Z
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return v0

    .line 2
    :cond_6
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->J()Z

    move-result v0

    return v0
.end method

.method public Y()V
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->K()V

    return-void
.end method

.method public Z()V
    .registers 2

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    return-void
.end method

.method public a(Landroid/os/Bundle;)Landroid/view/LayoutInflater;
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 17
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    if-eqz p1, :cond_12

    .line 18
    invoke-virtual {p1}, Lb/l/d/h;->k()Landroid/view/LayoutInflater;

    move-result-object p1

    .line 19
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->C()Landroid/view/LayoutInflater$Factory2;

    move-result-object v0

    invoke-static {p1, v0}, Lb/h/m/g;->b(Landroid/view/LayoutInflater;Landroid/view/LayoutInflater$Factory2;)V

    return-object p1

    .line 20
    :cond_12
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "onGetLayoutInflater() cannot be executed until the Fragment is attached to the FragmentManager."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 5

    .line 31
    iget p3, p0, Landroidx/fragment/app/Fragment;->c0:I

    if-eqz p3, :cond_a

    const/4 v0, 0x0

    .line 32
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_a
    const/4 p1, 0x0

    return-object p1
.end method

.method public a(IZI)Landroid/view/animation/Animation;
    .registers 4

    const/4 p1, 0x0

    return-object p1
.end method

.method public a(Ljava/lang/String;)Landroidx/fragment/app/Fragment;
    .registers 3

    .line 108
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-object p0

    .line 109
    :cond_9
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentManager;->d(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p1

    return-object p1
.end method

.method public a()Lb/n/e;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->Y:Lb/n/i;

    return-object v0
.end method

.method public final a(I)Ljava/lang/String;
    .registers 3

    .line 11
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->d()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public a(F)V
    .registers 3

    .line 128
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->i()Landroidx/fragment/app/Fragment$e;

    move-result-object v0

    iput p1, v0, Landroidx/fragment/app/Fragment$e;->u:F

    return-void
.end method

.method public a(IIII)V
    .registers 6

    .line 118
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_d

    if-nez p1, :cond_d

    if-nez p2, :cond_d

    if-nez p3, :cond_d

    if-nez p4, :cond_d

    return-void

    .line 119
    :cond_d
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->i()Landroidx/fragment/app/Fragment$e;

    move-result-object v0

    iput p1, v0, Landroidx/fragment/app/Fragment$e;->d:I

    .line 120
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->i()Landroidx/fragment/app/Fragment$e;

    move-result-object p1

    iput p2, p1, Landroidx/fragment/app/Fragment$e;->e:I

    .line 121
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->i()Landroidx/fragment/app/Fragment$e;

    move-result-object p1

    iput p3, p1, Landroidx/fragment/app/Fragment$e;->f:I

    .line 122
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->i()Landroidx/fragment/app/Fragment$e;

    move-result-object p1

    iput p4, p1, Landroidx/fragment/app/Fragment$e;->g:I

    return-void
.end method

.method public a(IILandroid/content/Intent;)V
    .registers 6
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x2

    .line 15
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_35

    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Fragment "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " received the following in onActivityResult(): requestCode: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " resultCode: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " data: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "FragmentManager"

    invoke-static {p2, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_35
    return-void
.end method

.method public a(I[Ljava/lang/String;[I)V
    .registers 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public a(Landroid/animation/Animator;)V
    .registers 3

    .line 127
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->i()Landroidx/fragment/app/Fragment$e;

    move-result-object v0

    iput-object p1, v0, Landroidx/fragment/app/Fragment$e;->b:Landroid/animation/Animator;

    return-void
.end method

.method public a(Landroid/app/Activity;)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 p1, 0x1

    .line 30
    iput-boolean p1, p0, Landroidx/fragment/app/Fragment;->M:Z

    return-void
.end method

.method public a(Landroid/app/Activity;Landroid/util/AttributeSet;Landroid/os/Bundle;)V
    .registers 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 p1, 0x1

    .line 25
    iput-boolean p1, p0, Landroidx/fragment/app/Fragment;->M:Z

    return-void
.end method

.method public a(Landroid/content/Context;)V
    .registers 3

    const/4 p1, 0x1

    .line 26
    iput-boolean p1, p0, Landroidx/fragment/app/Fragment;->M:Z

    .line 27
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    if-nez p1, :cond_9

    const/4 p1, 0x0

    goto :goto_d

    :cond_9
    invoke-virtual {p1}, Lb/l/d/h;->f()Landroid/app/Activity;

    move-result-object p1

    :goto_d
    if-eqz p1, :cond_15

    const/4 v0, 0x0

    .line 28
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    .line 29
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->a(Landroid/app/Activity;)V

    :cond_15
    return-void
.end method

.method public a(Landroid/content/Context;Landroid/util/AttributeSet;Landroid/os/Bundle;)V
    .registers 5

    const/4 p1, 0x1

    .line 21
    iput-boolean p1, p0, Landroidx/fragment/app/Fragment;->M:Z

    .line 22
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    if-nez p1, :cond_9

    const/4 p1, 0x0

    goto :goto_d

    :cond_9
    invoke-virtual {p1}, Lb/l/d/h;->f()Landroid/app/Activity;

    move-result-object p1

    :goto_d
    if-eqz p1, :cond_15

    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    .line 24
    invoke-virtual {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->a(Landroid/app/Activity;Landroid/util/AttributeSet;Landroid/os/Bundle;)V

    :cond_15
    return-void
.end method

.method public a(Landroid/content/Intent;Landroid/os/Bundle;)V
    .registers 5
    .param p1    # Landroid/content/Intent;
        .annotation build Landroid/annotation/SuppressLint;
            value = {
                "UnknownNullness"
            }
        .end annotation
    .end param

    .line 12
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    if-eqz v0, :cond_9

    const/4 v1, -0x1

    .line 13
    invoke-virtual {v0, p0, p1, v1, p2}, Lb/l/d/h;->a(Landroidx/fragment/app/Fragment;Landroid/content/Intent;ILandroid/os/Bundle;)V

    return-void

    .line 14
    :cond_9
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Fragment "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " not attached to Activity"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(Landroid/content/res/Configuration;)V
    .registers 3

    .line 110
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 111
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentManager;->a(Landroid/content/res/Configuration;)V

    return-void
.end method

.method public a(Landroid/view/Menu;)V
    .registers 2

    return-void
.end method

.method public a(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .registers 3

    return-void
.end method

.method public a(Landroid/view/View;)V
    .registers 3

    .line 126
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->i()Landroidx/fragment/app/Fragment$e;

    move-result-object v0

    iput-object p1, v0, Landroidx/fragment/app/Fragment$e;->a:Landroid/view/View;

    return-void
.end method

.method public a(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 3

    return-void
.end method

.method public a(Landroidx/fragment/app/Fragment$h;)V
    .registers 4

    .line 112
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->i()Landroidx/fragment/app/Fragment$e;

    .line 113
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    iget-object v0, v0, Landroidx/fragment/app/Fragment$e;->x:Landroidx/fragment/app/Fragment$h;

    if-ne p1, v0, :cond_a

    return-void

    :cond_a
    if-eqz p1, :cond_26

    if-nez v0, :cond_f

    goto :goto_26

    .line 114
    :cond_f
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Trying to set a replacement startPostponedEnterTransition on "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 115
    :cond_26
    :goto_26
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    iget-boolean v1, v0, Landroidx/fragment/app/Fragment$e;->w:Z

    if-eqz v1, :cond_2e

    .line 116
    iput-object p1, v0, Landroidx/fragment/app/Fragment$e;->x:Landroidx/fragment/app/Fragment$h;

    :cond_2e
    if-eqz p1, :cond_33

    .line 117
    invoke-interface {p1}, Landroidx/fragment/app/Fragment$h;->b()V

    :cond_33
    return-void
.end method

.method public a(Landroidx/fragment/app/Fragment;)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public a(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 7

    .line 43
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mFragmentId=#"

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 44
    iget v0, p0, Landroidx/fragment/app/Fragment;->D:I

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, " mContainerId=#"

    .line 45
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 46
    iget v0, p0, Landroidx/fragment/app/Fragment;->E:I

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, " mTag="

    .line 47
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroidx/fragment/app/Fragment;->F:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 48
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mState="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Landroidx/fragment/app/Fragment;->h:I

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(I)V

    const-string v0, " mWho="

    .line 49
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, " mBackStackNesting="

    .line 50
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Landroidx/fragment/app/Fragment;->y:I

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(I)V

    .line 51
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mAdded="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->s:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Z)V

    const-string v0, " mRemoving="

    .line 52
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->t:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Z)V

    const-string v0, " mFromLayout="

    .line 53
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->u:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Z)V

    const-string v0, " mInLayout="

    .line 54
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->v:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 55
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mHidden="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->G:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Z)V

    const-string v0, " mDetached="

    .line 56
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->H:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Z)V

    const-string v0, " mMenuVisible="

    .line 57
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->L:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Z)V

    const-string v0, " mHasMenu="

    .line 58
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->K:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 59
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mRetainInstance="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->I:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Z)V

    const-string v0, " mUserVisibleHint="

    .line 60
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->Q:Z

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 61
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    if-eqz v0, :cond_c8

    .line 62
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mFragmentManager="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 63
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 64
    :cond_c8
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    if-eqz v0, :cond_d9

    .line 65
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mHost="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 66
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 67
    :cond_d9
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->C:Landroidx/fragment/app/Fragment;

    if-eqz v0, :cond_ea

    .line 68
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mParentFragment="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 69
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->C:Landroidx/fragment/app/Fragment;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 70
    :cond_ea
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->n:Landroid/os/Bundle;

    if-eqz v0, :cond_fb

    .line 71
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mArguments="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroidx/fragment/app/Fragment;->n:Landroid/os/Bundle;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 72
    :cond_fb
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    if-eqz v0, :cond_10c

    .line 73
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mSavedFragmentState="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 74
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 75
    :cond_10c
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->j:Landroid/util/SparseArray;

    if-eqz v0, :cond_11d

    .line 76
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mSavedViewState="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 77
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->j:Landroid/util/SparseArray;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 78
    :cond_11d
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->k:Landroid/os/Bundle;

    if-eqz v0, :cond_12e

    .line 79
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mSavedViewRegistryState="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 80
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->k:Landroid/os/Bundle;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 81
    :cond_12e
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->L()Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_149

    .line 82
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v1, "mTarget="

    invoke-virtual {p3, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/Object;)V

    const-string v0, " mTargetRequestCode="

    .line 83
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 84
    iget v0, p0, Landroidx/fragment/app/Fragment;->q:I

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(I)V

    .line 85
    :cond_149
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mPopDirection="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->B()Z

    move-result v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 86
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->p()I

    move-result v0

    if-eqz v0, :cond_16d

    .line 87
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "getEnterAnim="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->p()I

    move-result v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(I)V

    .line 88
    :cond_16d
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->s()I

    move-result v0

    if-eqz v0, :cond_182

    .line 89
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "getExitAnim="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->s()I

    move-result v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(I)V

    .line 90
    :cond_182
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->C()I

    move-result v0

    if-eqz v0, :cond_197

    .line 91
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "getPopEnterAnim="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 92
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->C()I

    move-result v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(I)V

    .line 93
    :cond_197
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->D()I

    move-result v0

    if-eqz v0, :cond_1ac

    .line 94
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "getPopExitAnim="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->D()I

    move-result v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(I)V

    .line 95
    :cond_1ac
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    if-eqz v0, :cond_1bd

    .line 96
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mContainer="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 97
    :cond_1bd
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v0, :cond_1ce

    .line 98
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mView="

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 99
    :cond_1ce
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->l()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1e3

    .line 100
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v0, "mAnimatingAway="

    .line 101
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 102
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->l()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 103
    :cond_1e3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_1f0

    .line 104
    invoke-static {p0}, Lb/o/a/a;->a(Lb/n/h;)Lb/o/a/a;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Lb/o/a/a;->a(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 105
    :cond_1f0
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 106
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Child "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 107
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "  "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2, p3, p4}, Landroidx/fragment/app/FragmentManager;->a(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    return-void
.end method

.method public a(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 123
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->i()Landroidx/fragment/app/Fragment$e;

    .line 124
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    iput-object p1, v0, Landroidx/fragment/app/Fragment$e;->i:Ljava/util/ArrayList;

    .line 125
    iput-object p2, v0, Landroidx/fragment/app/Fragment$e;->j:Ljava/util/ArrayList;

    return-void
.end method

.method public a(Z)V
    .registers 5

    .line 33
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    goto :goto_e

    :cond_6
    const/4 v2, 0x0

    .line 34
    iput-boolean v2, v0, Landroidx/fragment/app/Fragment$e;->w:Z

    .line 35
    iget-object v2, v0, Landroidx/fragment/app/Fragment$e;->x:Landroidx/fragment/app/Fragment$h;

    .line 36
    iput-object v1, v0, Landroidx/fragment/app/Fragment$e;->x:Landroidx/fragment/app/Fragment$h;

    move-object v1, v2

    :goto_e
    if-eqz v1, :cond_14

    .line 37
    invoke-interface {v1}, Landroidx/fragment/app/Fragment$h;->a()V

    goto :goto_3f

    .line 38
    :cond_14
    sget-boolean v0, Landroidx/fragment/app/FragmentManager;->P:Z

    if-eqz v0, :cond_3f

    iget-object v0, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v0, :cond_3f

    iget-object v0, p0, Landroidx/fragment/app/Fragment;->N:Landroid/view/ViewGroup;

    if-eqz v0, :cond_3f

    iget-object v1, p0, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    if-eqz v1, :cond_3f

    .line 39
    invoke-static {v0, v1}, Lb/l/d/w;->a(Landroid/view/ViewGroup;Landroidx/fragment/app/FragmentManager;)Lb/l/d/w;

    move-result-object v0

    .line 40
    invoke-virtual {v0}, Lb/l/d/w;->e()V

    if-eqz p1, :cond_3c

    .line 41
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    invoke-virtual {p1}, Lb/l/d/h;->i()Landroid/os/Handler;

    move-result-object p1

    new-instance v1, Landroidx/fragment/app/Fragment$c;

    invoke-direct {v1, p0, v0}, Landroidx/fragment/app/Fragment$c;-><init>(Landroidx/fragment/app/Fragment;Lb/l/d/w;)V

    invoke-virtual {p1, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_3f

    .line 42
    :cond_3c
    invoke-virtual {v0}, Lb/l/d/w;->a()V

    :cond_3f
    :goto_3f
    return-void
.end method

.method public a(Landroid/view/MenuItem;)Z
    .registers 2

    const/4 p1, 0x0

    return p1
.end method

.method public a0()V
    .registers 1

    return-void
.end method

.method public b(IZI)Landroid/animation/Animator;
    .registers 4

    const/4 p1, 0x0

    return-object p1
.end method

.method public b(I)V
    .registers 3

    .line 18
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_7

    if-nez p1, :cond_7

    return-void

    .line 19
    :cond_7
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->i()Landroidx/fragment/app/Fragment$e;

    .line 20
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    iput p1, v0, Landroidx/fragment/app/Fragment$e;->h:I

    return-void
.end method

.method public b(Landroid/os/Bundle;)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 p1, 0x1

    .line 1
    iput-boolean p1, p0, Landroidx/fragment/app/Fragment;->M:Z

    return-void
.end method

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)V
    .registers 6

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->K()V

    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->x:Z

    .line 4
    new-instance v0, Lb/l/d/u;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->g()Lb/n/s;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lb/l/d/u;-><init>(Landroidx/fragment/app/Fragment;Lb/n/s;)V

    iput-object v0, p0, Landroidx/fragment/app/Fragment;->Z:Lb/l/d/u;

    .line 5
    invoke-virtual {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz p1, :cond_3d

    .line 6
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->Z:Lb/l/d/u;

    invoke-virtual {p1}, Lb/l/d/u;->d()V

    .line 7
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    iget-object p2, p0, Landroidx/fragment/app/Fragment;->Z:Lb/l/d/u;

    invoke-static {p1, p2}, Lb/n/u;->a(Landroid/view/View;Lb/n/h;)V

    .line 8
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    iget-object p2, p0, Landroidx/fragment/app/Fragment;->Z:Lb/l/d/u;

    invoke-static {p1, p2}, Lb/n/v;->a(Landroid/view/View;Lb/n/t;)V

    .line 9
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    iget-object p2, p0, Landroidx/fragment/app/Fragment;->Z:Lb/l/d/u;

    invoke-static {p1, p2}, Lb/q/d;->a(Landroid/view/View;Lb/q/c;)V

    .line 10
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->a0:Lb/n/m;

    iget-object p2, p0, Landroidx/fragment/app/Fragment;->Z:Lb/l/d/u;

    invoke-virtual {p1, p2}, Lb/n/m;->a(Ljava/lang/Object;)V

    goto :goto_48

    .line 11
    :cond_3d
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->Z:Lb/l/d/u;

    invoke-virtual {p1}, Lb/l/d/u;->e()Z

    move-result p1

    if-nez p1, :cond_49

    const/4 p1, 0x0

    .line 12
    iput-object p1, p0, Landroidx/fragment/app/Fragment;->Z:Lb/l/d/u;

    :goto_48
    return-void

    .line 13
    :cond_49
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Called getViewLifecycleOwner() but onCreateView() returned null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public b(Landroid/view/Menu;)V
    .registers 2

    return-void
.end method

.method public b(Z)V
    .registers 2

    return-void
.end method

.method public b(Landroid/view/Menu;Landroid/view/MenuInflater;)Z
    .registers 5

    .line 14
    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->G:Z

    const/4 v1, 0x0

    if-nez v0, :cond_18

    .line 15
    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->K:Z

    if-eqz v0, :cond_11

    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->L:Z

    if-eqz v0, :cond_11

    const/4 v1, 0x1

    .line 16
    invoke-virtual {p0, p1, p2}, Landroidx/fragment/app/Fragment;->a(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 17
    :cond_11
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p1, p2}, Landroidx/fragment/app/FragmentManager;->a(Landroid/view/Menu;Landroid/view/MenuInflater;)Z

    move-result p1

    or-int/2addr v1, p1

    :cond_18
    return v1
.end method

.method public b(Landroid/view/MenuItem;)Z
    .registers 2

    const/4 p1, 0x0

    return p1
.end method

.method public b0()V
    .registers 2

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    return-void
.end method

.method public final c()Landroidx/savedstate/SavedStateRegistry;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->b0:Lb/q/b;

    invoke-virtual {v0}, Lb/q/b;->a()Landroidx/savedstate/SavedStateRegistry;

    move-result-object v0

    return-object v0
.end method

.method public c(Landroid/os/Bundle;)V
    .registers 3

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    .line 3
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->k(Landroid/os/Bundle;)V

    .line 4
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentManager;->c(I)Z

    move-result p1

    if-nez p1, :cond_13

    .line 5
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->i()V

    :cond_13
    return-void
.end method

.method public c(Landroid/view/Menu;)V
    .registers 3

    .line 9
    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->G:Z

    if-nez v0, :cond_14

    .line 10
    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->K:Z

    if-eqz v0, :cond_f

    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->L:Z

    if-eqz v0, :cond_f

    .line 11
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->a(Landroid/view/Menu;)V

    .line 12
    :cond_f
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentManager;->a(Landroid/view/Menu;)V

    :cond_14
    return-void
.end method

.method public c(Landroid/view/View;)V
    .registers 3

    .line 13
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->i()Landroidx/fragment/app/Fragment$e;

    move-result-object v0

    iput-object p1, v0, Landroidx/fragment/app/Fragment$e;->v:Landroid/view/View;

    return-void
.end method

.method public c(Z)V
    .registers 2

    return-void
.end method

.method public c(Landroid/view/MenuItem;)Z
    .registers 3

    .line 6
    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->G:Z

    if-nez v0, :cond_13

    .line 7
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->a(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 p1, 0x1

    return p1

    .line 8
    :cond_c
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentManager;->a(Landroid/view/MenuItem;)Z

    move-result p1

    return p1

    :cond_13
    const/4 p1, 0x0

    return p1
.end method

.method public c0()V
    .registers 2

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    return-void
.end method

.method public final d()Landroid/content/res/Resources;
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->t0()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    return-object v0
.end method

.method public d(Landroid/os/Bundle;)Landroid/view/LayoutInflater;
    .registers 2

    .line 2
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->a(Landroid/os/Bundle;)Landroid/view/LayoutInflater;

    move-result-object p1

    return-object p1
.end method

.method public d(Z)V
    .registers 2

    return-void
.end method

.method public d(Landroid/view/Menu;)Z
    .registers 4

    .line 3
    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->G:Z

    const/4 v1, 0x0

    if-nez v0, :cond_18

    .line 4
    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->K:Z

    if-eqz v0, :cond_11

    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->L:Z

    if-eqz v0, :cond_11

    const/4 v1, 0x1

    .line 5
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->b(Landroid/view/Menu;)V

    .line 6
    :cond_11
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentManager;->b(Landroid/view/Menu;)Z

    move-result p1

    or-int/2addr v1, p1

    :cond_18
    return v1
.end method

.method public d(Landroid/view/MenuItem;)Z
    .registers 3

    .line 7
    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->G:Z

    if-nez v0, :cond_1b

    .line 8
    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->K:Z

    if-eqz v0, :cond_14

    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->L:Z

    if-eqz v0, :cond_14

    .line 9
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->b(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_14

    const/4 p1, 0x1

    return p1

    .line 10
    :cond_14
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentManager;->b(Landroid/view/MenuItem;)Z

    move-result p1

    return p1

    :cond_1b
    const/4 p1, 0x0

    return p1
.end method

.method public d0()V
    .registers 2

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    return-void
.end method

.method public e()Lb/l/d/e;
    .registers 2

    .line 1
    new-instance v0, Landroidx/fragment/app/Fragment$d;

    invoke-direct {v0, p0}, Landroidx/fragment/app/Fragment$d;-><init>(Landroidx/fragment/app/Fragment;)V

    return-object v0
.end method

.method public e(Landroid/os/Bundle;)V
    .registers 2

    return-void
.end method

.method public e(Z)V
    .registers 2

    return-void
.end method

.method public e0()V
    .registers 2

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 2

    .line 1
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public final f()Landroidx/fragment/app/FragmentActivity;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    goto :goto_c

    :cond_6
    invoke-virtual {v0}, Lb/l/d/h;->f()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroidx/fragment/app/FragmentActivity;

    :goto_c
    return-object v0
.end method

.method public f(Landroid/os/Bundle;)V
    .registers 2

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Landroidx/fragment/app/Fragment;->M:Z

    return-void
.end method

.method public f(Z)V
    .registers 3

    .line 3
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->c(Z)V

    .line 4
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentManager;->a(Z)V

    return-void
.end method

.method public f0()V
    .registers 2

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    return-void
.end method

.method public g()Lb/n/s;
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    if-eqz v0, :cond_1f

    .line 2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->x()I

    move-result v0

    sget-object v1, Lb/n/e$c;->INITIALIZED:Lb/n/e$c;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eq v0, v1, :cond_17

    .line 3
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p0}, Landroidx/fragment/app/FragmentManager;->l(Landroidx/fragment/app/Fragment;)Lb/n/s;

    move-result-object v0

    return-object v0

    .line 4
    :cond_17
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Calling getViewModelStore() before a Fragment reaches onCreate() when using setMaxLifecycle(INITIALIZED) is not supported"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 5
    :cond_1f
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can\'t access ViewModels from detached fragment"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public g(Landroid/os/Bundle;)V
    .registers 4

    .line 6
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->K()V

    const/4 v0, 0x3

    .line 7
    iput v0, p0, Landroidx/fragment/app/Fragment;->h:I

    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    .line 9
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->b(Landroid/os/Bundle;)V

    .line 10
    iget-boolean p1, p0, Landroidx/fragment/app/Fragment;->M:Z

    if-eqz p1, :cond_1b

    .line 11
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->v0()V

    .line 12
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->g()V

    return-void

    .line 13
    :cond_1b
    new-instance p1, Lb/l/d/y;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Fragment "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " did not call through to super.onActivityCreated()"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lb/l/d/y;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public g(Z)V
    .registers 3

    .line 14
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->d(Z)V

    .line 15
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentManager;->b(Z)V

    return-void
.end method

.method public g0()V
    .registers 2

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    return-void
.end method

.method public getContext()Landroid/content/Context;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    goto :goto_a

    :cond_6
    invoke-virtual {v0}, Lb/l/d/h;->h()Landroid/content/Context;

    move-result-object v0

    :goto_a
    return-object v0
.end method

.method public h(Landroid/os/Bundle;)V
    .registers 5

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->K()V

    const/4 v0, 0x1

    .line 2
    iput v0, p0, Landroidx/fragment/app/Fragment;->h:I

    const/4 v1, 0x0

    .line 3
    iput-boolean v1, p0, Landroidx/fragment/app/Fragment;->M:Z

    .line 4
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-lt v1, v2, :cond_1b

    .line 5
    iget-object v1, p0, Landroidx/fragment/app/Fragment;->Y:Lb/n/i;

    new-instance v2, Landroidx/fragment/app/Fragment$5;

    invoke-direct {v2, p0}, Landroidx/fragment/app/Fragment$5;-><init>(Landroidx/fragment/app/Fragment;)V

    invoke-virtual {v1, v2}, Lb/n/i;->a(Lb/n/g;)V

    .line 6
    :cond_1b
    iget-object v1, p0, Landroidx/fragment/app/Fragment;->b0:Lb/q/b;

    invoke-virtual {v1, p1}, Lb/q/b;->a(Landroid/os/Bundle;)V

    .line 7
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->c(Landroid/os/Bundle;)V

    .line 8
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->W:Z

    .line 9
    iget-boolean p1, p0, Landroidx/fragment/app/Fragment;->M:Z

    if-eqz p1, :cond_31

    .line 10
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->Y:Lb/n/i;

    sget-object v0, Lb/n/e$b;->ON_CREATE:Lb/n/e$b;

    invoke-virtual {p1, v0}, Lb/n/i;->a(Lb/n/e$b;)V

    return-void

    .line 11
    :cond_31
    new-instance p1, Lb/l/d/y;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Fragment "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " did not call through to super.onCreate()"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lb/l/d/y;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public h(Z)V
    .registers 3

    .line 12
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->i()Landroidx/fragment/app/Fragment$e;

    move-result-object v0

    iput-boolean p1, v0, Landroidx/fragment/app/Fragment$e;->y:Z

    return-void
.end method

.method public h0()V
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->d0:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment$g;

    .line 2
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment$g;->a()V

    goto :goto_6

    .line 3
    :cond_16
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->d0:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    iget-object v1, p0, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->e()Lb/l/d/e;

    move-result-object v2

    invoke-virtual {v0, v1, v2, p0}, Landroidx/fragment/app/FragmentManager;->a(Lb/l/d/h;Lb/l/d/e;Landroidx/fragment/app/Fragment;)V

    const/4 v0, 0x0

    .line 5
    iput v0, p0, Landroidx/fragment/app/Fragment;->h:I

    .line 6
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    .line 7
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    invoke-virtual {v0}, Lb/l/d/h;->h()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->a(Landroid/content/Context;)V

    .line 8
    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    if-eqz v0, :cond_43

    .line 9
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p0}, Landroidx/fragment/app/FragmentManager;->h(Landroidx/fragment/app/Fragment;)V

    .line 10
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->h()V

    return-void

    .line 11
    :cond_43
    new-instance v0, Lb/l/d/y;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " did not call through to super.onAttach()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lb/l/d/y;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final hashCode()I
    .registers 2

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public i(Landroid/os/Bundle;)Landroid/view/LayoutInflater;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->d(Landroid/os/Bundle;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Landroidx/fragment/app/Fragment;->V:Landroid/view/LayoutInflater;

    return-object p1
.end method

.method public final i()Landroidx/fragment/app/Fragment$e;
    .registers 2

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_b

    .line 3
    new-instance v0, Landroidx/fragment/app/Fragment$e;

    invoke-direct {v0}, Landroidx/fragment/app/Fragment$e;-><init>()V

    iput-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    .line 4
    :cond_b
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    return-object v0
.end method

.method public i(Z)V
    .registers 3

    .line 5
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_5

    return-void

    .line 6
    :cond_5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->i()Landroidx/fragment/app/Fragment$e;

    move-result-object v0

    iput-boolean p1, v0, Landroidx/fragment/app/Fragment$e;->c:Z

    return-void
.end method

.method public i0()V
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->j()V

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->Y:Lb/n/i;

    sget-object v1, Lb/n/e$b;->ON_DESTROY:Lb/n/e$b;

    invoke-virtual {v0, v1}, Lb/n/i;->a(Lb/n/e$b;)V

    const/4 v0, 0x0

    .line 3
    iput v0, p0, Landroidx/fragment/app/Fragment;->h:I

    .line 4
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    .line 5
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->W:Z

    .line 6
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->Z()V

    .line 7
    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    if-eqz v0, :cond_1b

    return-void

    .line 8
    :cond_1b
    new-instance v0, Lb/l/d/y;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " did not call through to super.onDestroy()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lb/l/d/y;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public j(Landroid/os/Bundle;)V
    .registers 4

    .line 3
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->e(Landroid/os/Bundle;)V

    .line 4
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->b0:Lb/q/b;

    invoke-virtual {v0, p1}, Lb/q/b;->b(Landroid/os/Bundle;)V

    .line 5
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->N()Landroid/os/Parcelable;

    move-result-object v0

    if-eqz v0, :cond_15

    const-string v1, "android:support:fragments"

    .line 6
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_15
    return-void
.end method

.method public j()Z
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-eqz v0, :cond_e

    iget-object v0, v0, Landroidx/fragment/app/Fragment$e;->r:Ljava/lang/Boolean;

    if-nez v0, :cond_9

    goto :goto_e

    .line 2
    :cond_9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_f

    :cond_e
    :goto_e
    const/4 v0, 0x1

    :goto_f
    return v0
.end method

.method public j0()V
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->k()V

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v0, :cond_22

    iget-object v0, p0, Landroidx/fragment/app/Fragment;->Z:Lb/l/d/u;

    invoke-virtual {v0}, Lb/l/d/u;->a()Lb/n/e;

    move-result-object v0

    invoke-virtual {v0}, Lb/n/e;->a()Lb/n/e$c;

    move-result-object v0

    sget-object v1, Lb/n/e$c;->CREATED:Lb/n/e$c;

    .line 3
    invoke-virtual {v0, v1}, Lb/n/e$c;->isAtLeast(Lb/n/e$c;)Z

    move-result v0

    if-eqz v0, :cond_22

    .line 4
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->Z:Lb/l/d/u;

    sget-object v1, Lb/n/e$b;->ON_DESTROY:Lb/n/e$b;

    invoke-virtual {v0, v1}, Lb/l/d/u;->a(Lb/n/e$b;)V

    :cond_22
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Landroidx/fragment/app/Fragment;->h:I

    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    .line 7
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->b0()V

    .line 8
    iget-boolean v1, p0, Landroidx/fragment/app/Fragment;->M:Z

    if-eqz v1, :cond_39

    .line 9
    invoke-static {p0}, Lb/o/a/a;->a(Lb/n/h;)Lb/o/a/a;

    move-result-object v1

    invoke-virtual {v1}, Lb/o/a/a;->a()V

    .line 10
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->x:Z

    return-void

    .line 11
    :cond_39
    new-instance v0, Lb/l/d/y;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " did not call through to super.onDestroyView()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lb/l/d/y;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public k(Landroid/os/Bundle;)V
    .registers 3

    if-eqz p1, :cond_14

    const-string v0, "android:support:fragments"

    .line 1
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    if-eqz p1, :cond_14

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentManager;->a(Landroid/os/Parcelable;)V

    .line 3
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->i()V

    :cond_14
    return-void
.end method

.method public k()Z
    .registers 2

    .line 4
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-eqz v0, :cond_e

    iget-object v0, v0, Landroidx/fragment/app/Fragment$e;->q:Ljava/lang/Boolean;

    if-nez v0, :cond_9

    goto :goto_e

    .line 5
    :cond_9
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_f

    :cond_e
    :goto_e
    const/4 v0, 0x1

    :goto_f
    return v0
.end method

.method public k0()V
    .registers 4

    const/4 v0, -0x1

    .line 1
    iput v0, p0, Landroidx/fragment/app/Fragment;->h:I

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->c0()V

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Landroidx/fragment/app/Fragment;->V:Landroid/view/LayoutInflater;

    .line 5
    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    if-eqz v0, :cond_25

    .line 6
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->I()Z

    move-result v0

    if-nez v0, :cond_24

    .line 7
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->j()V

    .line 8
    new-instance v0, Lb/l/d/k;

    invoke-direct {v0}, Lb/l/d/k;-><init>()V

    iput-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    :cond_24
    return-void

    .line 9
    :cond_25
    new-instance v0, Lb/l/d/y;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " did not call through to super.onDetach()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lb/l/d/y;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public l()Landroid/view/View;
    .registers 2

    .line 13
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return-object v0

    .line 14
    :cond_6
    iget-object v0, v0, Landroidx/fragment/app/Fragment$e;->a:Landroid/view/View;

    return-object v0
.end method

.method public final l(Landroid/os/Bundle;)V
    .registers 5

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->j:Landroid/util/SparseArray;

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    .line 2
    iget-object v2, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->restoreHierarchyState(Landroid/util/SparseArray;)V

    .line 3
    iput-object v1, p0, Landroidx/fragment/app/Fragment;->j:Landroid/util/SparseArray;

    .line 4
    :cond_c
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v0, :cond_19

    .line 5
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->Z:Lb/l/d/u;

    iget-object v2, p0, Landroidx/fragment/app/Fragment;->k:Landroid/os/Bundle;

    invoke-virtual {v0, v2}, Lb/l/d/u;->a(Landroid/os/Bundle;)V

    .line 6
    iput-object v1, p0, Landroidx/fragment/app/Fragment;->k:Landroid/os/Bundle;

    :cond_19
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    .line 8
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->f(Landroid/os/Bundle;)V

    .line 9
    iget-boolean p1, p0, Landroidx/fragment/app/Fragment;->M:Z

    if-eqz p1, :cond_2f

    .line 10
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz p1, :cond_2e

    .line 11
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->Z:Lb/l/d/u;

    sget-object v0, Lb/n/e$b;->ON_CREATE:Lb/n/e$b;

    invoke-virtual {p1, v0}, Lb/l/d/u;->a(Lb/n/e$b;)V

    :cond_2e
    return-void

    .line 12
    :cond_2f
    new-instance p1, Lb/l/d/y;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Fragment "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " did not call through to super.onViewStateRestored()"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lb/l/d/y;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public l0()V
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->onLowMemory()V

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->l()V

    return-void
.end method

.method public m()Landroid/animation/Animator;
    .registers 2

    .line 4
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return-object v0

    .line 5
    :cond_6
    iget-object v0, v0, Landroidx/fragment/app/Fragment$e;->b:Landroid/animation/Animator;

    return-object v0
.end method

.method public m(Landroid/os/Bundle;)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    if-eqz v0, :cond_13

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->X()Z

    move-result v0

    if-nez v0, :cond_b

    goto :goto_13

    .line 2
    :cond_b
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Fragment already added and state has been saved"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 3
    :cond_13
    :goto_13
    iput-object p1, p0, Landroidx/fragment/app/Fragment;->n:Landroid/os/Bundle;

    return-void
.end method

.method public m0()V
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()V

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v0, :cond_10

    .line 3
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->Z:Lb/l/d/u;

    sget-object v1, Lb/n/e$b;->ON_PAUSE:Lb/n/e$b;

    invoke-virtual {v0, v1}, Lb/l/d/u;->a(Lb/n/e$b;)V

    .line 4
    :cond_10
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->Y:Lb/n/i;

    sget-object v1, Lb/n/e$b;->ON_PAUSE:Lb/n/e$b;

    invoke-virtual {v0, v1}, Lb/n/i;->a(Lb/n/e$b;)V

    const/4 v0, 0x6

    .line 5
    iput v0, p0, Landroidx/fragment/app/Fragment;->h:I

    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    .line 7
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->d0()V

    .line 8
    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    if-eqz v0, :cond_25

    return-void

    .line 9
    :cond_25
    new-instance v0, Lb/l/d/y;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " did not call through to super.onPause()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lb/l/d/y;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final n()Landroid/os/Bundle;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->n:Landroid/os/Bundle;

    return-object v0
.end method

.method public n0()V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->z:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p0}, Landroidx/fragment/app/FragmentManager;->q(Landroidx/fragment/app/Fragment;)Z

    move-result v0

    .line 2
    iget-object v1, p0, Landroidx/fragment/app/Fragment;->r:Ljava/lang/Boolean;

    if-eqz v1, :cond_10

    .line 3
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eq v1, v0, :cond_1e

    .line 4
    :cond_10
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Landroidx/fragment/app/Fragment;->r:Ljava/lang/Boolean;

    .line 5
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->e(Z)V

    .line 6
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->n()V

    :cond_1e
    return-void
.end method

.method public final o()Landroidx/fragment/app/FragmentManager;
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    if-eqz v0, :cond_7

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    return-object v0

    .line 3
    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " has not been attached yet."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public o0()V
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->K()V

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->d(Z)Z

    const/4 v0, 0x7

    .line 3
    iput v0, p0, Landroidx/fragment/app/Fragment;->h:I

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->e0()V

    .line 6
    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    if-eqz v0, :cond_30

    .line 7
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->Y:Lb/n/i;

    sget-object v1, Lb/n/e$b;->ON_RESUME:Lb/n/e$b;

    invoke-virtual {v0, v1}, Lb/n/i;->a(Lb/n/e$b;)V

    .line 8
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v0, :cond_2a

    .line 9
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->Z:Lb/l/d/u;

    sget-object v1, Lb/n/e$b;->ON_RESUME:Lb/n/e$b;

    invoke-virtual {v0, v1}, Lb/l/d/u;->a(Lb/n/e$b;)V

    .line 10
    :cond_2a
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->o()V

    return-void

    .line 11
    :cond_30
    new-instance v0, Lb/l/d/y;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " did not call through to super.onResume()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lb/l/d/y;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    const/4 p1, 0x1

    .line 1
    iput-boolean p1, p0, Landroidx/fragment/app/Fragment;->M:Z

    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .registers 5

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->s0()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Landroid/app/Activity;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    return-void
.end method

.method public onLowMemory()V
    .registers 2

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    return-void
.end method

.method public p()I
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return v0

    .line 2
    :cond_6
    iget v0, v0, Landroidx/fragment/app/Fragment$e;->d:I

    return v0
.end method

.method public p0()V
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->K()V

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->d(Z)Z

    const/4 v0, 0x5

    .line 3
    iput v0, p0, Landroidx/fragment/app/Fragment;->h:I

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->f0()V

    .line 6
    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    if-eqz v0, :cond_30

    .line 7
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->Y:Lb/n/i;

    sget-object v1, Lb/n/e$b;->ON_START:Lb/n/e$b;

    invoke-virtual {v0, v1}, Lb/n/i;->a(Lb/n/e$b;)V

    .line 8
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v0, :cond_2a

    .line 9
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->Z:Lb/l/d/u;

    sget-object v1, Lb/n/e$b;->ON_START:Lb/n/e$b;

    invoke-virtual {v0, v1}, Lb/l/d/u;->a(Lb/n/e$b;)V

    .line 10
    :cond_2a
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->p()V

    return-void

    .line 11
    :cond_30
    new-instance v0, Lb/l/d/y;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " did not call through to super.onStart()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lb/l/d/y;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public q()Ljava/lang/Object;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return-object v0

    .line 2
    :cond_6
    iget-object v0, v0, Landroidx/fragment/app/Fragment$e;->k:Ljava/lang/Object;

    return-object v0
.end method

.method public q0()V
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->q()V

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v0, :cond_10

    .line 3
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->Z:Lb/l/d/u;

    sget-object v1, Lb/n/e$b;->ON_STOP:Lb/n/e$b;

    invoke-virtual {v0, v1}, Lb/l/d/u;->a(Lb/n/e$b;)V

    .line 4
    :cond_10
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->Y:Lb/n/i;

    sget-object v1, Lb/n/e$b;->ON_STOP:Lb/n/e$b;

    invoke-virtual {v0, v1}, Lb/n/i;->a(Lb/n/e$b;)V

    const/4 v0, 0x4

    .line 5
    iput v0, p0, Landroidx/fragment/app/Fragment;->h:I

    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    .line 7
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->g0()V

    .line 8
    iget-boolean v0, p0, Landroidx/fragment/app/Fragment;->M:Z

    if-eqz v0, :cond_25

    return-void

    .line 9
    :cond_25
    new-instance v0, Lb/l/d/y;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " did not call through to super.onStop()"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lb/l/d/y;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public r()Lb/h/d/e;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return-object v0

    .line 2
    :cond_6
    iget-object v0, v0, Landroidx/fragment/app/Fragment$e;->s:Lb/h/d/e;

    return-object v0
.end method

.method public r0()V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    iget-object v1, p0, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    invoke-virtual {p0, v0, v1}, Landroidx/fragment/app/Fragment;->a(Landroid/view/View;Landroid/os/Bundle;)V

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->B:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->r()V

    return-void
.end method

.method public s()I
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return v0

    .line 2
    :cond_6
    iget v0, v0, Landroidx/fragment/app/Fragment$e;->e:I

    return v0
.end method

.method public final s0()Landroidx/fragment/app/FragmentActivity;
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->f()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_7

    return-object v0

    .line 2
    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " not attached to an activity."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public startActivity(Landroid/content/Intent;)V
    .registers 3
    .param p1    # Landroid/content/Intent;
        .annotation build Landroid/annotation/SuppressLint;
            value = {
                "UnknownNullness"
            }
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, v0}, Landroidx/fragment/app/Fragment;->a(Landroid/content/Intent;Landroid/os/Bundle;)V

    return-void
.end method

.method public t()Ljava/lang/Object;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return-object v0

    .line 2
    :cond_6
    iget-object v0, v0, Landroidx/fragment/app/Fragment$e;->m:Ljava/lang/Object;

    return-object v0
.end method

.method public final t0()Landroid/content/Context;
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_7

    return-object v0

    .line 2
    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " not attached to a context."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 3
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "{"

    .line 4
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 5
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    .line 6
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ("

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 8
    iget-object v1, p0, Landroidx/fragment/app/Fragment;->m:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    iget v1, p0, Landroidx/fragment/app/Fragment;->D:I

    if-eqz v1, :cond_43

    const-string v1, " id=0x"

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    iget v1, p0, Landroidx/fragment/app/Fragment;->D:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    :cond_43
    iget-object v1, p0, Landroidx/fragment/app/Fragment;->F:Ljava/lang/String;

    if-eqz v1, :cond_51

    const-string v1, " tag="

    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    iget-object v1, p0, Landroidx/fragment/app/Fragment;->F:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_51
    const-string v1, ")"

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public u()Lb/h/d/e;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return-object v0

    .line 2
    :cond_6
    iget-object v0, v0, Landroidx/fragment/app/Fragment$e;->t:Lb/h/d/e;

    return-object v0
.end method

.method public final u0()Landroid/view/View;
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->M()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_7

    return-object v0

    .line 2
    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fragment "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " did not return a View from onCreateView() or this was called before onCreateView()."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public v()Landroid/view/View;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return-object v0

    .line 2
    :cond_6
    iget-object v0, v0, Landroidx/fragment/app/Fragment$e;->v:Landroid/view/View;

    return-object v0
.end method

.method public final v0()V
    .registers 3

    const/4 v0, 0x3

    .line 1
    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->d(I)Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "moveto RESTORE_VIEW_STATE: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FragmentManager"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    :cond_1d
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->O:Landroid/view/View;

    if-eqz v0, :cond_26

    .line 4
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->l(Landroid/os/Bundle;)V

    :cond_26
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Landroidx/fragment/app/Fragment;->i:Landroid/os/Bundle;

    return-void
.end method

.method public final w()Ljava/lang/Object;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    goto :goto_a

    :cond_6
    invoke-virtual {v0}, Lb/l/d/h;->j()Ljava/lang/Object;

    move-result-object v0

    :goto_a
    return-object v0
.end method

.method public w0()V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-eqz v0, :cond_3c

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->i()Landroidx/fragment/app/Fragment$e;

    move-result-object v0

    iget-boolean v0, v0, Landroidx/fragment/app/Fragment$e;->w:Z

    if-nez v0, :cond_d

    goto :goto_3c

    .line 2
    :cond_d
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    if-nez v0, :cond_19

    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->i()Landroidx/fragment/app/Fragment$e;

    move-result-object v0

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroidx/fragment/app/Fragment$e;->w:Z

    goto :goto_3c

    .line 4
    :cond_19
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    iget-object v1, p0, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    invoke-virtual {v1}, Lb/l/d/h;->i()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_38

    .line 5
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->A:Lb/l/d/h;

    invoke-virtual {v0}, Lb/l/d/h;->i()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Landroidx/fragment/app/Fragment$b;

    invoke-direct {v1, p0}, Landroidx/fragment/app/Fragment$b;-><init>(Landroidx/fragment/app/Fragment;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    goto :goto_3c

    :cond_38
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->a(Z)V

    :cond_3c
    :goto_3c
    return-void
.end method

.method public final x()I
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->X:Lb/n/e$c;

    sget-object v1, Lb/n/e$c;->INITIALIZED:Lb/n/e$c;

    if-eq v0, v1, :cond_1a

    iget-object v1, p0, Landroidx/fragment/app/Fragment;->C:Landroidx/fragment/app/Fragment;

    if-nez v1, :cond_b

    goto :goto_1a

    .line 2
    :cond_b
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    iget-object v1, p0, Landroidx/fragment/app/Fragment;->C:Landroidx/fragment/app/Fragment;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->x()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0

    .line 3
    :cond_1a
    :goto_1a
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->X:Lb/n/e$c;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    return v0
.end method

.method public y()I
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->R:Landroidx/fragment/app/Fragment$e;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return v0

    .line 2
    :cond_6
    iget v0, v0, Landroidx/fragment/app/Fragment$e;->h:I

    return v0
.end method

.method public final z()Landroidx/fragment/app/Fragment;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->C:Landroidx/fragment/app/Fragment;

    return-object v0
.end method
