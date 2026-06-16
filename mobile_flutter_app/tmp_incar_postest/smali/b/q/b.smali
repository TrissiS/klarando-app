.class public final Lb/q/b;
.super Ljava/lang/Object;
.source "SavedStateRegistryController.java"


# instance fields
.field public final a:Lb/q/c;

.field public final b:Landroidx/savedstate/SavedStateRegistry;


# direct methods
.method public constructor <init>(Lb/q/c;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lb/q/b;->a:Lb/q/c;

    .line 3
    new-instance p1, Landroidx/savedstate/SavedStateRegistry;

    invoke-direct {p1}, Landroidx/savedstate/SavedStateRegistry;-><init>()V

    iput-object p1, p0, Lb/q/b;->b:Landroidx/savedstate/SavedStateRegistry;

    return-void
.end method

.method public static a(Lb/q/c;)Lb/q/b;
    .registers 2

    .line 7
    new-instance v0, Lb/q/b;

    invoke-direct {v0, p0}, Lb/q/b;-><init>(Lb/q/c;)V

    return-object v0
.end method


# virtual methods
.method public a()Landroidx/savedstate/SavedStateRegistry;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/q/b;->b:Landroidx/savedstate/SavedStateRegistry;

    return-object v0
.end method

.method public a(Landroid/os/Bundle;)V
    .registers 5

    .line 2
    iget-object v0, p0, Lb/q/b;->a:Lb/q/c;

    invoke-interface {v0}, Lb/n/h;->a()Lb/n/e;

    move-result-object v0

    .line 3
    invoke-virtual {v0}, Lb/n/e;->a()Lb/n/e$c;

    move-result-object v1

    sget-object v2, Lb/n/e$c;->INITIALIZED:Lb/n/e$c;

    if-ne v1, v2, :cond_1e

    .line 4
    new-instance v1, Landroidx/savedstate/Recreator;

    iget-object v2, p0, Lb/q/b;->a:Lb/q/c;

    invoke-direct {v1, v2}, Landroidx/savedstate/Recreator;-><init>(Lb/q/c;)V

    invoke-virtual {v0, v1}, Lb/n/e;->a(Lb/n/g;)V

    .line 5
    iget-object v1, p0, Lb/q/b;->b:Landroidx/savedstate/SavedStateRegistry;

    invoke-virtual {v1, v0, p1}, Landroidx/savedstate/SavedStateRegistry;->a(Lb/n/e;Landroid/os/Bundle;)V

    return-void

    .line 6
    :cond_1e
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Restarter must be created only during owner\'s initialization stage"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public b(Landroid/os/Bundle;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/q/b;->b:Landroidx/savedstate/SavedStateRegistry;

    invoke-virtual {v0, p1}, Landroidx/savedstate/SavedStateRegistry;->a(Landroid/os/Bundle;)V

    return-void
.end method
