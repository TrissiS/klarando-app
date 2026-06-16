.class public Lc/a/a/a/h0/b$b;
.super Ljava/lang/Object;
.source "BaseProgressIndicator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/h0/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lc/a/a/a/h0/b;


# direct methods
.method public constructor <init>(Lc/a/a/a/h0/b;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/h0/b$b;->h:Lc/a/a/a/h0/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/b$b;->h:Lc/a/a/a/h0/b;

    invoke-static {v0}, Lc/a/a/a/h0/b;->b(Lc/a/a/a/h0/b;)V

    .line 2
    iget-object v0, p0, Lc/a/a/a/h0/b$b;->h:Lc/a/a/a/h0/b;

    const-wide/16 v1, -0x1

    invoke-static {v0, v1, v2}, Lc/a/a/a/h0/b;->a(Lc/a/a/a/h0/b;J)J

    return-void
.end method
