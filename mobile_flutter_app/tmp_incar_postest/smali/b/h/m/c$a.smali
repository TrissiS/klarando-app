.class public final Lb/h/m/c$a;
.super Ljava/lang/Object;
.source "ContentInfoCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/m/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Landroid/content/ClipData;

.field public b:I

.field public c:I

.field public d:Landroid/net/Uri;

.field public e:Landroid/os/Bundle;


# direct methods
.method public constructor <init>(Landroid/content/ClipData;I)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lb/h/m/c$a;->a:Landroid/content/ClipData;

    .line 3
    iput p2, p0, Lb/h/m/c$a;->b:I

    return-void
.end method


# virtual methods
.method public a(I)Lb/h/m/c$a;
    .registers 2

    .line 1
    iput p1, p0, Lb/h/m/c$a;->c:I

    return-object p0
.end method

.method public a(Landroid/net/Uri;)Lb/h/m/c$a;
    .registers 2

    .line 2
    iput-object p1, p0, Lb/h/m/c$a;->d:Landroid/net/Uri;

    return-object p0
.end method

.method public a(Landroid/os/Bundle;)Lb/h/m/c$a;
    .registers 2

    .line 3
    iput-object p1, p0, Lb/h/m/c$a;->e:Landroid/os/Bundle;

    return-object p0
.end method

.method public a()Lb/h/m/c;
    .registers 2

    .line 4
    new-instance v0, Lb/h/m/c;

    invoke-direct {v0, p0}, Lb/h/m/c;-><init>(Lb/h/m/c$a;)V

    return-object v0
.end method
