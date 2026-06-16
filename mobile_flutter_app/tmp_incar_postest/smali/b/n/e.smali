.class public abstract Lb/n/e;
.super Ljava/lang/Object;
.source "Lifecycle.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/n/e$c;,
        Lb/n/e$b;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract a()Lb/n/e$c;
.end method

.method public abstract a(Lb/n/g;)V
.end method

.method public abstract b(Lb/n/g;)V
.end method
