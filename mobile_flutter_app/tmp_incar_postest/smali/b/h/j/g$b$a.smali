.class public Lb/h/j/g$b$a;
.super Ljava/lang/Object;
.source "RequestExecutor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/h/j/g$b;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lb/h/l/a;

.field public final synthetic i:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lb/h/j/g$b;Lb/h/l/a;Ljava/lang/Object;)V
    .registers 4

    .line 1
    iput-object p2, p0, Lb/h/j/g$b$a;->h:Lb/h/l/a;

    iput-object p3, p0, Lb/h/j/g$b$a;->i:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/h/j/g$b$a;->h:Lb/h/l/a;

    iget-object v1, p0, Lb/h/j/g$b$a;->i:Ljava/lang/Object;

    invoke-interface {v0, v1}, Lb/h/l/a;->a(Ljava/lang/Object;)V

    return-void
.end method
