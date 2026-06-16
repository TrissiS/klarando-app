.class public Lb/s/v;
.super Ljava/lang/Object;
.source "TransitionManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/s/v$a;
    }
.end annotation


# static fields
.field public static a:Landroidx/transition/Transition;

.field public static b:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/lang/ref/WeakReference<",
            "Lb/e/a<",
            "Landroid/view/ViewGroup;",
            "Ljava/util/ArrayList<",
            "Landroidx/transition/Transition;",
            ">;>;>;>;"
        }
    .end annotation
.end field

.field public static c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/ViewGroup;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Landroidx/transition/AutoTransition;

    invoke-direct {v0}, Landroidx/transition/AutoTransition;-><init>()V

    sput-object v0, Lb/s/v;->a:Landroidx/transition/Transition;

    .line 2
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lb/s/v;->b:Ljava/lang/ThreadLocal;

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lb/s/v;->c:Ljava/util/ArrayList;

    return-void
.end method

.method public static a()Lb/e/a;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lb/e/a<",
            "Landroid/view/ViewGroup;",
            "Ljava/util/ArrayList<",
            "Landroidx/transition/Transition;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Lb/s/v;->b:Ljava/lang/ThreadLocal;

    .line 2
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_13

    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/e/a;

    if-eqz v0, :cond_13

    return-object v0

    .line 4
    :cond_13
    new-instance v0, Lb/e/a;

    invoke-direct {v0}, Lb/e/a;-><init>()V

    .line 5
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 6
    sget-object v2, Lb/s/v;->b:Ljava/lang/ThreadLocal;

    invoke-virtual {v2, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    return-object v0
.end method

.method public static a(Landroid/view/ViewGroup;Landroidx/transition/Transition;)V
    .registers 3

    .line 7
    sget-object v0, Lb/s/v;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    invoke-static {p0}, Lb/h/m/y;->K(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 8
    sget-object v0, Lb/s/v;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-nez p1, :cond_17

    .line 9
    sget-object p1, Lb/s/v;->a:Landroidx/transition/Transition;

    .line 10
    :cond_17
    invoke-virtual {p1}, Landroidx/transition/Transition;->clone()Landroidx/transition/Transition;

    move-result-object p1

    .line 11
    invoke-static {p0, p1}, Lb/s/v;->c(Landroid/view/ViewGroup;Landroidx/transition/Transition;)V

    const/4 v0, 0x0

    .line 12
    invoke-static {p0, v0}, Lb/s/r;->a(Landroid/view/ViewGroup;Lb/s/r;)V

    .line 13
    invoke-static {p0, p1}, Lb/s/v;->b(Landroid/view/ViewGroup;Landroidx/transition/Transition;)V

    :cond_25
    return-void
.end method

.method public static b(Landroid/view/ViewGroup;Landroidx/transition/Transition;)V
    .registers 3

    if-eqz p1, :cond_13

    if-eqz p0, :cond_13

    .line 1
    new-instance v0, Lb/s/v$a;

    invoke-direct {v0, p1, p0}, Lb/s/v$a;-><init>(Landroidx/transition/Transition;Landroid/view/ViewGroup;)V

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :cond_13
    return-void
.end method

.method public static c(Landroid/view/ViewGroup;Landroidx/transition/Transition;)V
    .registers 4

    .line 1
    invoke-static {}, Lb/s/v;->a()Lb/e/a;

    move-result-object v0

    invoke-virtual {v0, p0}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_26

    .line 2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_26

    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_26

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/transition/Transition;

    .line 4
    invoke-virtual {v1, p0}, Landroidx/transition/Transition;->c(Landroid/view/View;)V

    goto :goto_16

    :cond_26
    if-eqz p1, :cond_2c

    const/4 v0, 0x1

    .line 5
    invoke-virtual {p1, p0, v0}, Landroidx/transition/Transition;->a(Landroid/view/ViewGroup;Z)V

    .line 6
    :cond_2c
    invoke-static {p0}, Lb/s/r;->a(Landroid/view/ViewGroup;)Lb/s/r;

    move-result-object p0

    if-eqz p0, :cond_35

    .line 7
    invoke-virtual {p0}, Lb/s/r;->a()V

    :cond_35
    return-void
.end method
