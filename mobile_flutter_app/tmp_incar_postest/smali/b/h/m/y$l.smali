.class public Lb/h/m/y$l;
.super Ljava/lang/Object;
.source "ViewCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/m/y;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "l"
.end annotation


# static fields
.field public static final d:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field public a:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public b:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;>;"
        }
    .end annotation
.end field

.field public c:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/KeyEvent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lb/h/m/y$l;->d:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lb/h/m/y$l;->a:Ljava/util/WeakHashMap;

    .line 3
    iput-object v0, p0, Lb/h/m/y$l;->b:Landroid/util/SparseArray;

    .line 4
    iput-object v0, p0, Lb/h/m/y$l;->c:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public static a(Landroid/view/View;)Lb/h/m/y$l;
    .registers 3

    .line 4
    sget v0, Lb/h/b;->tag_unhandled_key_event_manager:I

    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/h/m/y$l;

    if-nez v0, :cond_14

    .line 6
    new-instance v0, Lb/h/m/y$l;

    invoke-direct {v0}, Lb/h/m/y$l;-><init>()V

    .line 7
    sget v1, Lb/h/b;->tag_unhandled_key_event_manager:I

    invoke-virtual {p0, v1, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_14
    return-object v0
.end method


# virtual methods
.method public final a()Landroid/util/SparseArray;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lb/h/m/y$l;->b:Landroid/util/SparseArray;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lb/h/m/y$l;->b:Landroid/util/SparseArray;

    .line 3
    :cond_b
    iget-object v0, p0, Lb/h/m/y$l;->b:Landroid/util/SparseArray;

    return-object v0
.end method

.method public a(Landroid/view/KeyEvent;)Z
    .registers 7

    .line 15
    iget-object v0, p0, Lb/h/m/y$l;->c:Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    .line 16
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_c

    return v1

    .line 17
    :cond_c
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lb/h/m/y$l;->c:Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0}, Lb/h/m/y$l;->a()Landroid/util/SparseArray;

    move-result-object v2

    .line 19
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_32

    .line 20
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->indexOfKey(I)I

    move-result v3

    if-ltz v3, :cond_32

    .line 21
    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 22
    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->removeAt(I)V

    :cond_32
    if-nez v0, :cond_3e

    .line 23
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    :cond_3e
    if-eqz v0, :cond_52

    .line 24
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_51

    .line 25
    invoke-static {v0}, Lb/h/m/y;->J(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_51

    .line 26
    invoke-virtual {p0, v0, p1}, Lb/h/m/y$l;->c(Landroid/view/View;Landroid/view/KeyEvent;)Z

    :cond_51
    return v4

    :cond_52
    return v1
.end method

.method public a(Landroid/view/View;Landroid/view/KeyEvent;)Z
    .registers 5

    .line 8
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_9

    .line 9
    invoke-virtual {p0}, Lb/h/m/y$l;->b()V

    .line 10
    :cond_9
    invoke-virtual {p0, p1, p2}, Lb/h/m/y$l;->b(Landroid/view/View;Landroid/view/KeyEvent;)Landroid/view/View;

    move-result-object p1

    .line 11
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_2b

    .line 12
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p2

    if-eqz p1, :cond_2b

    .line 13
    invoke-static {p2}, Landroid/view/KeyEvent;->isModifierKey(I)Z

    move-result v0

    if-nez v0, :cond_2b

    .line 14
    invoke-virtual {p0}, Lb/h/m/y$l;->a()Landroid/util/SparseArray;

    move-result-object v0

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, p2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_2b
    if-eqz p1, :cond_2f

    const/4 p1, 0x1

    goto :goto_30

    :cond_2f
    const/4 p1, 0x0

    :goto_30
    return p1
.end method

.method public final b(Landroid/view/View;Landroid/view/KeyEvent;)Landroid/view/View;
    .registers 7

    .line 1
    iget-object v0, p0, Lb/h/m/y$l;->a:Ljava/util/WeakHashMap;

    const/4 v1, 0x0

    if-eqz v0, :cond_30

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    goto :goto_30

    .line 2
    :cond_c
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_29

    .line 3
    move-object v0, p1

    check-cast v0, Landroid/view/ViewGroup;

    .line 4
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    :goto_19
    if-ltz v2, :cond_29

    .line 5
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 6
    invoke-virtual {p0, v3, p2}, Lb/h/m/y$l;->b(Landroid/view/View;Landroid/view/KeyEvent;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_26

    return-object v3

    :cond_26
    add-int/lit8 v2, v2, -0x1

    goto :goto_19

    .line 7
    :cond_29
    invoke-virtual {p0, p1, p2}, Lb/h/m/y$l;->c(Landroid/view/View;Landroid/view/KeyEvent;)Z

    move-result p2

    if-eqz p2, :cond_30

    return-object p1

    :cond_30
    :goto_30
    return-object v1
.end method

.method public final b()V
    .registers 7

    .line 8
    iget-object v0, p0, Lb/h/m/y$l;->a:Ljava/util/WeakHashMap;

    if-eqz v0, :cond_7

    .line 9
    invoke-virtual {v0}, Ljava/util/WeakHashMap;->clear()V

    .line 10
    :cond_7
    sget-object v0, Lb/h/m/y$l;->d:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_10

    return-void

    .line 11
    :cond_10
    sget-object v0, Lb/h/m/y$l;->d:Ljava/util/ArrayList;

    monitor-enter v0

    .line 12
    :try_start_13
    iget-object v1, p0, Lb/h/m/y$l;->a:Ljava/util/WeakHashMap;

    if-nez v1, :cond_1e

    .line 13
    new-instance v1, Ljava/util/WeakHashMap;

    invoke-direct {v1}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v1, p0, Lb/h/m/y$l;->a:Ljava/util/WeakHashMap;

    .line 14
    :cond_1e
    sget-object v1, Lb/h/m/y$l;->d:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_26
    if-ltz v1, :cond_5f

    .line 15
    sget-object v2, Lb/h/m/y$l;->d:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 16
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    if-nez v2, :cond_3e

    .line 17
    sget-object v2, Lb/h/m/y$l;->d:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_5c

    .line 18
    :cond_3e
    iget-object v3, p0, Lb/h/m/y$l;->a:Ljava/util/WeakHashMap;

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3, v2, v4}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    .line 20
    :goto_49
    instance-of v3, v2, Landroid/view/View;

    if-eqz v3, :cond_5c

    .line 21
    iget-object v3, p0, Lb/h/m/y$l;->a:Ljava/util/WeakHashMap;

    move-object v4, v2

    check-cast v4, Landroid/view/View;

    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3, v4, v5}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    invoke-interface {v2}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    goto :goto_49

    :cond_5c
    :goto_5c
    add-int/lit8 v1, v1, -0x1

    goto :goto_26

    .line 23
    :cond_5f
    monitor-exit v0

    return-void

    :catchall_61
    move-exception v1

    monitor-exit v0
    :try_end_63
    .catchall {:try_start_13 .. :try_end_63} :catchall_61

    throw v1
.end method

.method public final c(Landroid/view/View;Landroid/view/KeyEvent;)Z
    .registers 7

    .line 1
    sget v0, Lb/h/b;->tag_unhandled_key_listeners:I

    .line 2
    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_22

    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    :goto_10
    if-ltz v1, :cond_22

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb/h/m/y$k;

    invoke-interface {v3, p1, p2}, Lb/h/m/y$k;->a(Landroid/view/View;Landroid/view/KeyEvent;)Z

    move-result v3

    if-eqz v3, :cond_1f

    return v2

    :cond_1f
    add-int/lit8 v1, v1, -0x1

    goto :goto_10

    :cond_22
    const/4 p1, 0x0

    return p1
.end method
