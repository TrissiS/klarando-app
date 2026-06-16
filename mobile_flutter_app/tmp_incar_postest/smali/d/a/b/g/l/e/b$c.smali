.class public Ld/a/b/g/l/e/b$c;
.super Ljava/lang/Object;
.source "DefaultDownloadNotifier.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ld/a/b/g/l/e/b;->b()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Ld/a/b/g/l/e/b;


# direct methods
.method public constructor <init>(Ld/a/b/g/l/e/b;)V
    .registers 2

    .line 1
    iput-object p1, p0, Ld/a/b/g/l/e/b$c;->h:Ld/a/b/g/l/e/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 3

    .line 1
    iget-object p2, p0, Ld/a/b/g/l/e/b$c;->h:Ld/a/b/g/l/e/b;

    invoke-static {p2}, Ld/a/b/g/l/e/b;->c(Ld/a/b/g/l/e/b;)Ld/a/b/g/l/f/b;

    move-result-object p2

    invoke-virtual {p2}, Ld/a/b/g/l/f/b;->g()Z

    move-result p2

    if-eqz p2, :cond_14

    .line 2
    invoke-static {}, Ld/a/b/g/l/g/a;->d()Ld/a/b/g/l/g/a;

    move-result-object p1

    invoke-virtual {p1}, Ld/a/b/g/l/g/a;->a()V

    goto :goto_17

    .line 3
    :cond_14
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    :goto_17
    return-void
.end method
