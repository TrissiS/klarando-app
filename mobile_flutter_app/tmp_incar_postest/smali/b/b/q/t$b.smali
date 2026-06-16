.class public Lb/b/q/t$b;
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
    name = "b"
.end annotation


# instance fields
.field public final synthetic h:Lb/b/q/t;


# direct methods
.method public constructor <init>(Lb/b/q/t;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/b/q/t$b;->h:Lb/b/q/t;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/t$b;->h:Lb/b/q/t;

    invoke-virtual {v0}, Lb/b/q/t;->e()V

    return-void
.end method
