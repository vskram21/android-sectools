.class public final enum Lorg/eclipse/jgit/diff/Edit$Type;
.super Ljava/lang/Enum;
.source "Edit.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/diff/Edit;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/diff/Edit$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/diff/Edit$Type;

.field public static final enum DELETE:Lorg/eclipse/jgit/diff/Edit$Type;

.field public static final enum EMPTY:Lorg/eclipse/jgit/diff/Edit$Type;

.field public static final enum INSERT:Lorg/eclipse/jgit/diff/Edit$Type;

.field public static final enum REPLACE:Lorg/eclipse/jgit/diff/Edit$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 70
    new-instance v0, Lorg/eclipse/jgit/diff/Edit$Type;

    const-string v1, "INSERT"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/diff/Edit$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/diff/Edit$Type;->INSERT:Lorg/eclipse/jgit/diff/Edit$Type;

    .line 73
    new-instance v0, Lorg/eclipse/jgit/diff/Edit$Type;

    const-string v1, "DELETE"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/diff/Edit$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/diff/Edit$Type;->DELETE:Lorg/eclipse/jgit/diff/Edit$Type;

    .line 76
    new-instance v0, Lorg/eclipse/jgit/diff/Edit$Type;

    const-string v1, "REPLACE"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/diff/Edit$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/diff/Edit$Type;->REPLACE:Lorg/eclipse/jgit/diff/Edit$Type;

    .line 79
    new-instance v0, Lorg/eclipse/jgit/diff/Edit$Type;

    const-string v1, "EMPTY"

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/diff/Edit$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/diff/Edit$Type;->EMPTY:Lorg/eclipse/jgit/diff/Edit$Type;

    .line 68
    const/4 v0, 0x4

    new-array v0, v0, [Lorg/eclipse/jgit/diff/Edit$Type;

    sget-object v1, Lorg/eclipse/jgit/diff/Edit$Type;->INSERT:Lorg/eclipse/jgit/diff/Edit$Type;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/diff/Edit$Type;->DELETE:Lorg/eclipse/jgit/diff/Edit$Type;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/diff/Edit$Type;->REPLACE:Lorg/eclipse/jgit/diff/Edit$Type;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/diff/Edit$Type;->EMPTY:Lorg/eclipse/jgit/diff/Edit$Type;

    aput-object v1, v0, v5

    sput-object v0, Lorg/eclipse/jgit/diff/Edit$Type;->$VALUES:[Lorg/eclipse/jgit/diff/Edit$Type;

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
    .line 68
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/diff/Edit$Type;
    .locals 1
    .parameter "name"

    .prologue
    .line 68
    const-class v0, Lorg/eclipse/jgit/diff/Edit$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/Edit$Type;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/diff/Edit$Type;
    .locals 1

    .prologue
    .line 68
    sget-object v0, Lorg/eclipse/jgit/diff/Edit$Type;->$VALUES:[Lorg/eclipse/jgit/diff/Edit$Type;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/diff/Edit$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/diff/Edit$Type;

    return-object v0
.end method
