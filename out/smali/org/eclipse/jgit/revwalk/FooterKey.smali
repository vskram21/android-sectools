.class public final Lorg/eclipse/jgit/revwalk/FooterKey;
.super Ljava/lang/Object;
.source "FooterKey.java"


# static fields
.field public static final ACKED_BY:Lorg/eclipse/jgit/revwalk/FooterKey;

.field public static final CC:Lorg/eclipse/jgit/revwalk/FooterKey;

.field public static final SIGNED_OFF_BY:Lorg/eclipse/jgit/revwalk/FooterKey;


# instance fields
.field private final name:Ljava/lang/String;

.field final raw:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 51
    new-instance v0, Lorg/eclipse/jgit/revwalk/FooterKey;

    const-string v1, "Signed-off-by"

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/FooterKey;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/revwalk/FooterKey;->SIGNED_OFF_BY:Lorg/eclipse/jgit/revwalk/FooterKey;

    .line 54
    new-instance v0, Lorg/eclipse/jgit/revwalk/FooterKey;

    const-string v1, "Acked-by"

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/FooterKey;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/revwalk/FooterKey;->ACKED_BY:Lorg/eclipse/jgit/revwalk/FooterKey;

    .line 57
    new-instance v0, Lorg/eclipse/jgit/revwalk/FooterKey;

    const-string v1, "CC"

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/FooterKey;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/eclipse/jgit/revwalk/FooterKey;->CC:Lorg/eclipse/jgit/revwalk/FooterKey;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "keyName"

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/FooterKey;->name:Ljava/lang/String;

    .line 71
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/FooterKey;->raw:[B

    .line 72
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/FooterKey;->name:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FooterKey["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/FooterKey;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
