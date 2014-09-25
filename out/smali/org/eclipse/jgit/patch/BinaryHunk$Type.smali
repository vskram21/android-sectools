.class public final enum Lorg/eclipse/jgit/patch/BinaryHunk$Type;
.super Ljava/lang/Enum;
.source "BinaryHunk.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/patch/BinaryHunk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/patch/BinaryHunk$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/patch/BinaryHunk$Type;

.field public static final enum DELTA_DEFLATED:Lorg/eclipse/jgit/patch/BinaryHunk$Type;

.field public static final enum LITERAL_DEFLATED:Lorg/eclipse/jgit/patch/BinaryHunk$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 61
    new-instance v0, Lorg/eclipse/jgit/patch/BinaryHunk$Type;

    const-string v1, "LITERAL_DEFLATED"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/patch/BinaryHunk$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/patch/BinaryHunk$Type;->LITERAL_DEFLATED:Lorg/eclipse/jgit/patch/BinaryHunk$Type;

    .line 64
    new-instance v0, Lorg/eclipse/jgit/patch/BinaryHunk$Type;

    const-string v1, "DELTA_DEFLATED"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/patch/BinaryHunk$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/patch/BinaryHunk$Type;->DELTA_DEFLATED:Lorg/eclipse/jgit/patch/BinaryHunk$Type;

    .line 59
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/eclipse/jgit/patch/BinaryHunk$Type;

    sget-object v1, Lorg/eclipse/jgit/patch/BinaryHunk$Type;->LITERAL_DEFLATED:Lorg/eclipse/jgit/patch/BinaryHunk$Type;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/patch/BinaryHunk$Type;->DELTA_DEFLATED:Lorg/eclipse/jgit/patch/BinaryHunk$Type;

    aput-object v1, v0, v3

    sput-object v0, Lorg/eclipse/jgit/patch/BinaryHunk$Type;->$VALUES:[Lorg/eclipse/jgit/patch/BinaryHunk$Type;

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
    .line 59
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/patch/BinaryHunk$Type;
    .locals 1
    .parameter "name"

    .prologue
    .line 59
    const-class v0, Lorg/eclipse/jgit/patch/BinaryHunk$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/patch/BinaryHunk$Type;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/patch/BinaryHunk$Type;
    .locals 1

    .prologue
    .line 59
    sget-object v0, Lorg/eclipse/jgit/patch/BinaryHunk$Type;->$VALUES:[Lorg/eclipse/jgit/patch/BinaryHunk$Type;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/patch/BinaryHunk$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/patch/BinaryHunk$Type;

    return-object v0
.end method
