.class public Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;
.super Ljava/lang/Object;
.source "OnBackPressedDispatcher.java"

# interfaces
.implements Lb/n/f;
.implements Lb/a/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/activity/OnBackPressedDispatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LifecycleOnBackPressedCancellable"
.end annotation


# instance fields
.field public final a:Lb/n/e;

.field public final b:Lb/a/b;

.field public c:Lb/a/a;

.field public final synthetic d:Landroidx/activity/OnBackPressedDispatcher;


# direct methods
.method public constructor <init>(Landroidx/activity/OnBackPressedDispatcher;Lb/n/e;Lb/a/b;)V
    .registers 4

    .line 1
    iput-object p1, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->d:Landroidx/activity/OnBackPressedDispatcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->a:Lb/n/e;

    .line 3
    iput-object p3, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->b:Lb/a/b;

    .line 4
    invoke-virtual {p2, p0}, Lb/n/e;->a(Lb/n/g;)V

    return-void
.end method


# virtual methods
.method public a(Lb/n/h;Lb/n/e$b;)V
    .registers 3

    .line 1
    sget-object p1, Lb/n/e$b;->ON_START:Lb/n/e$b;

    if-ne p2, p1, :cond_f

    .line 2
    iget-object p1, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->d:Landroidx/activity/OnBackPressedDispatcher;

    iget-object p2, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->b:Lb/a/b;

    invoke-virtual {p1, p2}, Landroidx/activity/OnBackPressedDispatcher;->a(Lb/a/b;)Lb/a/a;

    move-result-object p1

    iput-object p1, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->c:Lb/a/a;

    goto :goto_22

    .line 3
    :cond_f
    sget-object p1, Lb/n/e$b;->ON_STOP:Lb/n/e$b;

    if-ne p2, p1, :cond_1b

    .line 4
    iget-object p1, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->c:Lb/a/a;

    if-eqz p1, :cond_22

    .line 5
    invoke-interface {p1}, Lb/a/a;->cancel()V

    goto :goto_22

    .line 6
    :cond_1b
    sget-object p1, Lb/n/e$b;->ON_DESTROY:Lb/n/e$b;

    if-ne p2, p1, :cond_22

    .line 7
    invoke-virtual {p0}, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->cancel()V

    :cond_22
    :goto_22
    return-void
.end method

.method public cancel()V
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->a:Lb/n/e;

    invoke-virtual {v0, p0}, Lb/n/e;->b(Lb/n/g;)V

    .line 2
    iget-object v0, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->b:Lb/a/b;

    invoke-virtual {v0, p0}, Lb/a/b;->b(Lb/a/a;)V

    .line 3
    iget-object v0, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->c:Lb/a/a;

    if-eqz v0, :cond_14

    .line 4
    invoke-interface {v0}, Lb/a/a;->cancel()V

    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Landroidx/activity/OnBackPressedDispatcher$LifecycleOnBackPressedCancellable;->c:Lb/a/a;

    :cond_14
    return-void
.end method
