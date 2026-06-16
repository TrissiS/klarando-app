.class public Lb/b/q/t$a;
.super Ljava/lang/Object;
.source "ForwardingListener.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/b/q/t;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic h:Lb/b/q/t;


# direct methods
.method public constructor <init>(Lb/b/q/t;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/b/q/t$a;->h:Lb/b/q/t;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/q/t$a;->h:Lb/b/q/t;

    iget-object v0, v0, Lb/b/q/t;->k:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_e

    const/4 v1, 0x1

    .line 2
    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_e
    return-void
.end method
