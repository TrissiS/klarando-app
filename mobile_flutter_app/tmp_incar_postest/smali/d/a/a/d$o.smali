.class public final Ld/a/a/d$o;
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
    name = "o"
.end annotation


# instance fields
.field public final h:Ljava/lang/Runnable;

.field public final i:J


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;J)V
    .registers 4

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Ld/a/a/d$o;->h:Ljava/lang/Runnable;

    .line 4
    iput-wide p2, p0, Ld/a/a/d$o;->i:J

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Runnable;JLd/a/a/d$a;)V
    .registers 5

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ld/a/a/d$o;-><init>(Ljava/lang/Runnable;J)V

    return-void
.end method


# virtual methods
.method public a(Ld/a/a/d;)V
    .registers 5

    .line 1
    iget-object v0, p0, Ld/a/a/d$o;->h:Ljava/lang/Runnable;

    if-nez v0, :cond_5

    return-void

    .line 2
    :cond_5
    invoke-virtual {p1, p0}, Ld/a/a/d;->b(Ld/a/a/d$m;)V

    .line 3
    iget-object v0, p0, Ld/a/a/d$o;->h:Ljava/lang/Runnable;

    iget-wide v1, p0, Ld/a/a/d$o;->i:J

    invoke-interface {p1, v0, v1, v2}, Ld/a/a/g/g;->a(Ljava/lang/Runnable;J)Z

    return-void
.end method
