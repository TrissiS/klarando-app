.class public final Landroidx/lifecycle/SavedStateHandleController$a;
.super Ljava/lang/Object;
.source "SavedStateHandleController.java"

# interfaces
.implements Landroidx/savedstate/SavedStateRegistry$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/lifecycle/SavedStateHandleController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lb/q/c;)V
    .registers 7

    .line 1
    instance-of v0, p1, Lb/n/t;

    if-eqz v0, :cond_3f

    .line 2
    move-object v0, p1

    check-cast v0, Lb/n/t;

    invoke-interface {v0}, Lb/n/t;->g()Lb/n/s;

    move-result-object v0

    .line 3
    invoke-interface {p1}, Lb/q/c;->c()Landroidx/savedstate/SavedStateRegistry;

    move-result-object v1

    .line 4
    invoke-virtual {v0}, Lb/n/s;->b()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_17
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 5
    invoke-virtual {v0, v3}, Lb/n/s;->a(Ljava/lang/String;)Lb/n/q;

    move-result-object v3

    .line 6
    invoke-interface {p1}, Lb/n/h;->a()Lb/n/e;

    move-result-object v4

    invoke-static {v3, v1, v4}, Landroidx/lifecycle/SavedStateHandleController;->a(Lb/n/q;Landroidx/savedstate/SavedStateRegistry;Lb/n/e;)V

    goto :goto_17

    .line 7
    :cond_2f
    invoke-virtual {v0}, Lb/n/s;->b()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_3e

    .line 8
    const-class p1, Landroidx/lifecycle/SavedStateHandleController$a;

    invoke-virtual {v1, p1}, Landroidx/savedstate/SavedStateRegistry;->a(Ljava/lang/Class;)V

    :cond_3e
    return-void

    .line 9
    :cond_3f
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Internal error: OnRecreation should be registered only on componentsthat implement ViewModelStoreOwner"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
