.class public Lc/a/a/a/n0/e$a;
.super Ljava/lang/Object;
.source "SnackbarManager.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/n0/e;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/n0/e;


# direct methods
.method public constructor <init>(Lc/a/a/a/n0/e;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/n0/e$a;->a:Lc/a/a/a/n0/e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .registers 3

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    if-eqz v0, :cond_6

    const/4 p1, 0x0

    return p1

    .line 2
    :cond_6
    iget-object v0, p0, Lc/a/a/a/n0/e$a;->a:Lc/a/a/a/n0/e;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lc/a/a/a/n0/e$c;

    invoke-virtual {v0, p1}, Lc/a/a/a/n0/e;->a(Lc/a/a/a/n0/e$c;)V

    const/4 p1, 0x1

    return p1
.end method
