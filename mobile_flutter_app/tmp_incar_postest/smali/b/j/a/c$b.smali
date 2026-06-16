.class public Lb/j/a/c$b;
.super Ljava/lang/Object;
.source "ViewDragHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/j/a/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lb/j/a/c;


# direct methods
.method public constructor <init>(Lb/j/a/c;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/j/a/c$b;->h:Lb/j/a/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/j/a/c$b;->h:Lb/j/a/c;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lb/j/a/c;->f(I)V

    return-void
.end method
