.class public final enum Lorg/eclipse/jgit/diff/DiffEntry$Side;
.super Ljava/lang/Enum;
.source "DiffEntry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/diff/DiffEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Side"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/diff/DiffEntry$Side;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/diff/DiffEntry$Side;

.field public static final enum NEW:Lorg/eclipse/jgit/diff/DiffEntry$Side;

.field public static final enum OLD:Lorg/eclipse/jgit/diff/DiffEntry$Side;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 91
    new-instance v0, Lorg/eclipse/jgit/diff/DiffEntry$Side;

    const-string v1, "OLD"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/diff/DiffEntry$Side;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/diff/DiffEntry$Side;->OLD:Lorg/eclipse/jgit/diff/DiffEntry$Side;

    .line 94
    new-instance v0, Lorg/eclipse/jgit/diff/DiffEntry$Side;

    const-string v1, "NEW"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/diff/DiffEntry$Side;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/diff/DiffEntry$Side;->NEW:Lorg/eclipse/jgit/diff/DiffEntry$Side;

    .line 89
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/eclipse/jgit/diff/DiffEntry$Side;

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$Side;->OLD:Lorg/eclipse/jgit/diff/DiffEntry$Side;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$Side;->NEW:Lorg/eclipse/jgit/diff/DiffEntry$Side;

    aput-object v1, v0, v3

    sput-object v0, Lorg/eclipse/jgit/diff/DiffEntry$Side;->$VALUES:[Lorg/eclipse/jgit/diff/DiffEntry$Side;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 89
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/diff/DiffEntry$Side;
    .locals 1
    .parameter "name"

    .prologue
    .line 89
    const-class v0, Lorg/eclipse/jgit/diff/DiffEntry$Side;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/DiffEntry$Side;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/diff/DiffEntry$Side;
    .locals 1

    .prologue
    .line 89
    sget-object v0, Lorg/eclipse/jgit/diff/DiffEntry$Side;->$VALUES:[Lorg/eclipse/jgit/diff/DiffEntry$Side;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/diff/DiffEntry$Side;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/diff/DiffEntry$Side;

    return-object v0
.end method
