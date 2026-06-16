.class public Lc/a/a/a/n0/e$c;
.super Ljava/lang/Object;
.source "SnackbarManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/n0/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public final a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lc/a/a/a/n0/e$b;",
            ">;"
        }
    .end annotation
.end field

.field public b:I

.field public c:Z


# virtual methods
.method public a(Lc/a/a/a/n0/e$b;)Z
    .registers 3

    if-eqz p1, :cond_c

    .line 1
    iget-object v0, p0, Lc/a/a/a/n0/e$c;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_c

    const/4 p1, 0x1

    goto :goto_d

    :cond_c
    const/4 p1, 0x0

    :goto_d
    return p1
.end method
