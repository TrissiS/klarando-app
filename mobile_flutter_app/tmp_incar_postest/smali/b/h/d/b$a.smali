.class public Lb/h/d/b$a;
.super Ljava/lang/Object;
.source "ActivityRecreator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/h/d/b;->a(Landroid/app/Activity;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lb/h/d/b$d;

.field public final synthetic i:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lb/h/d/b$d;Ljava/lang/Object;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lb/h/d/b$a;->h:Lb/h/d/b$d;

    iput-object p2, p0, Lb/h/d/b$a;->i:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/h/d/b$a;->h:Lb/h/d/b$d;

    iget-object v1, p0, Lb/h/d/b$a;->i:Ljava/lang/Object;

    iput-object v1, v0, Lb/h/d/b$d;->h:Ljava/lang/Object;

    return-void
.end method
