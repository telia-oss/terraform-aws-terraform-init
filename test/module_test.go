package module_test

import (
	"fmt"
	"strings"
	"testing"

	tfinit "github.com/telia-oss/terraform-aws-terraform-init/v2/test"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestModule(t *testing.T) {
	tests := []struct {
		description string
		directory   string
		name        string
		region      string
		expected    tfinit.Expectations
	}{
		{
			description: "basic example",
			directory:   "../examples/basic",
			name:        fmt.Sprintf("terraform-init-basic-test-%s", random.UniqueId()),
			region:      "eu-west-1",
			expected:    tfinit.Expectations{},
		},
	}

	for _, tc := range tests {
		tc := tc // Source: https://gist.github.com/posener/92a55c4cd441fc5e5e85f27bca008721
		t.Run(tc.description, func(t *testing.T) {
			t.Parallel()

			options := &terraform.Options{
				TerraformDir: tc.directory,

				Vars: map[string]interface{}{
					// aws_s3_bucket requires lowercase name.
					"name_prefix": strings.ToLower(tc.name),
					"region":      tc.region,
				},

				EnvVars: map[string]string{
					"AWS_DEFAULT_REGION": tc.region,
				},
			}

			defer terraform.Destroy(t, options)
			terraform.InitAndApply(t, options)

			tfinit.RunTestSuite(t,
				tc.region,
				tc.expected,
			)
		})
	}
}
