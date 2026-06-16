.class public Lb/n/i$a;
.super Ljava/lang/Object;
.source "LifecycleRegistry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/n/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Lb/n/e$c;

.field public b:Lb/n/f;


# direct methods
.method public constructor <init>(Lb/n/g;Lb/n/e$c;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-static {p1}, Lb/n/k;->a(Ljava/lang/Object;)Lb/n/f;

    move-result-object p1

    iput-object p1, p0, Lb/n/i$a;->b:Lb/n/f;

    .line 3
    iput-object p2, p0, Lb/n/i$a;->a:Lb/n/e$c;

    return-void
.end method


# virtual methods
.method public a(Lb/n/h;Lb/n/e$b;)V
    .registers 5

    .line 1
    invoke-virtual {p2}, Lb/n/e$b;->getTargetState()Lb/n/e$c;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lb/n/i$a;->a:Lb/n/e$c;

    invoke-static {v1, v0}, Lb/n/i;->a(Lb/n/e$c;Lb/n/e$c;)Lb/n/e$c;

    move-result-object v1

    iput-object v1, p0, Lb/n/i$a;->a:Lb/n/e$c;

    .line 3
    iget-object v1, p0, Lb/n/i$a;->b:Lb/n/f;

    invoke-interface {v1, p1, p2}, Lb/n/f;->a(Lb/n/h;Lb/n/e$b;)V

    .line 4
    iput-object v0, p0, Lb/n/i$a;->a:Lb/n/e$c;

    return-void
.end method
