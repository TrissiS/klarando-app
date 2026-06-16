.class public final Ld/a/a/d$f;
.super Ljava/lang/Object;
.source "BaseDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ld/a/a/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "f"
.end annotation


# instance fields
.field public final h:Ld/a/a/d$l;


# direct methods
.method public constructor <init>(Ld/a/a/d$l;)V
    .registers 2

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Ld/a/a/d$f;->h:Ld/a/a/d$l;

    return-void
.end method

.method public synthetic constructor <init>(Ld/a/a/d$l;Ld/a/a/d$a;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Ld/a/a/d$f;-><init>(Ld/a/a/d$l;)V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .registers 5

    .line 1
    iget-object p2, p0, Ld/a/a/d$f;->h:Ld/a/a/d$l;

    if-eqz p2, :cond_10

    instance-of v0, p1, Ld/a/a/d;

    if-nez v0, :cond_9

    goto :goto_10

    .line 2
    :cond_9
    check-cast p1, Ld/a/a/d;

    invoke-interface {p2, p1, p3}, Ld/a/a/d$l;->a(Ld/a/a/d;Landroid/view/KeyEvent;)Z

    move-result p1

    return p1

    :cond_10
    :goto_10
    const/4 p1, 0x0

    return p1
.end method
