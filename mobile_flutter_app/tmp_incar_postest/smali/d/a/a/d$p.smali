.class public final Ld/a/a/d$p;
.super Ljava/lang/Object;
.source "BaseDialog.java"

# interfaces
.implements Ld/a/a/d$m;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ld/a/a/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "p"
.end annotation


# instance fields
.field public final h:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;)V
    .registers 2

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Ld/a/a/d$p;->h:Ljava/lang/Runnable;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Runnable;Ld/a/a/d$a;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Ld/a/a/d$p;-><init>(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public a(Ld/a/a/d;)V
    .registers 3

    .line 1
    iget-object v0, p0, Ld/a/a/d$p;->h:Ljava/lang/Runnable;

    if-nez v0, :cond_5

    return-void

    .line 2
    :cond_5
    invoke-virtual {p1, p0}, Ld/a/a/d;->b(Ld/a/a/d$m;)V

    .line 3
    iget-object v0, p0, Ld/a/a/d$p;->h:Ljava/lang/Runnable;

    invoke-interface {p1, v0}, Ld/a/a/g/g;->a(Ljava/lang/Runnable;)Z

    return-void
.end method
