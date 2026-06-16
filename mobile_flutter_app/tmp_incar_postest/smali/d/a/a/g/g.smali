.class public interface abstract Ld/a/a/g/g;
.super Ljava/lang/Object;
.source "HandlerAction.java"


# static fields
.field public static final g:Landroid/os/Handler;


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    .line 1
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Ld/a/a/g/g;->g:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public abstract a(Ljava/lang/Runnable;)Z
.end method

.method public abstract a(Ljava/lang/Runnable;J)Z
.end method

.method public abstract b(Ljava/lang/Runnable;J)Z
.end method

.method public abstract h()V
.end method
